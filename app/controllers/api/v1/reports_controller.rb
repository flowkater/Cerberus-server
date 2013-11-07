class Api::V1::ReportsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		@project = Project.find_by_api_key(params[:api_key])
		if params[:scenario_id]
			@scenario = Scenario.find(params[:scenario_id])
			@report = @project.reports.build(scenario_id: @scenario.id)
		else
			@report = @project.reports.build
		end
		
		@memory_checked = params[:memory_checked] == "true" ? true : false
		@cpu_checked = params[:cpu_checked] == "true" ? true : false
		@network_checked = params[:network_checked] == "true" ? true : false
		@battery_checked = params[:battery_checked] == "true" ? true : false

		Report.transaction do
			begin
				@report.save
				@components = []

				if @memory_checked
					@report.create_memory
					@components << "memory"
				end

				if @cpu_checked
        	@report.create_cpu
        	@components << "cpu"
        end

        if @network_checked
        	@report.create_network
        	@components << "network"	
        end

        if @battery_checked
        	@report.create_battery 
        	@components << "battery"
        end

				render status: :created, json: {response: "success create", report_id: @report.id, components: @components}	
			rescue Exception => e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback			
			end
		end
	end

	def update
		@report = Report.find(params[:id])
		@network = @report.network
		@battery = @report.battery
		 
		@latency_methods = @network.latency_methods.build(JSON.parse(params[:latency_methods])) if @network
		@components = @battery.components.build(JSON.parse(params[:components])) if @battery

		Report.transaction do
			begin
				LatencyMethod.import @latency_methods if @network
				Component.import @components if @battery
				@report.update_attributes(osversion: params[:osversion], appversion: params[:appversion], time_for_profiling: params[:time_for_profiling])

				render status: :created, json: {response: "success profiling update"}
			rescue Exception => e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback
			end
		end
	end
end