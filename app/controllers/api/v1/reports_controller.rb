class Api::V1::ReportsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		@project = Project.find_by_api_key(params[:api_key])
		@report = @project.reports.build

		if params[:scenario_id]
			@scenario = Scenario.find(params[:scenario_id])
			@report.scenario_id = @scenario.id
			@report.scenario_test = true
		end

		@report.app_icon = params[:app_icon]
		@report.memory_checked = params[:memory_checked]
		@report.cpu_checked = params[:cpu_checked]
		@report.network_checked = params[:network_checked]
		@report.battery_checked = params[:battery_checked]

		Report.transaction do
			begin
				@report.save
				@report.create_memory
				@report.create_cpu
				@report.create_network
				@report.create_battery 

				render status: :created, json: {response: "success create", report_id: @report.id}	
			rescue Exception => e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback			
			end
		end
	end

	def update
		@report = Report.find(params[:id])
		@project = @report.project
		@memory = @report.memory
		@cpu = @report.cpu
		@network = @report.network
		@battery = @report.battery

		if @memory
			@memory.hprof1 = params[:hprof1]  
			@memory.hprof2 = params[:hprof2]
		end
		
		@cpu.trace = params[:trace] if @cpu
		@latency_methods = @network.latency_methods.build(JSON.parse(params[:latency_methods])) if @network
		@components = @battery.components.build(JSON.parse(params[:components])) if @battery
		
		Report.transaction do
			begin
				LatencyMethod.import @latency_methods if @network
				Component.import @components if @battery
				@scenario = @project.scenarios.create(profile: true)

				@report.update_attributes(osversion: params[:osversion], appversion: params[:appversion], time_for_profiling: params[:time_for_profiling], scenario_id: @scenario.id)

				MemoryCpuWorker.perform_async(@report.id)
				
				@records = @scenario.records.build(JSON.parse(params[:records]))
				Record.import @records
				
				@scenario.record_node_update

				render status: :created, json: {response: "success profiling update", trace:  params[:trace], hprof: params[:hprof]}
			rescue Exception => e
				print e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback
			end
		end
	end

	def memory_leak_instance
		@report = Report.find(params[:id])
		@memory = @report.memory
		@leak_instances = @memory.leak_instances
		render 'memories/v1/leak_instances'
	end

	def memory_leak_class
		@report = Report.find(params[:id])
		@memory = @report.memory
		@leak_classes = @memory.leak_classes
		render 'memories/v1/leak_classes'
	end

	def cpu
		@report = Report.find(params[:id])
		@cpu = @report.cpu
		@trace_method = @cpu.trace_methods.first
		render 'cpus/v1/show'
	end
end