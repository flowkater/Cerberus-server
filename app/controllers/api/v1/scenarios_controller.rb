class Api::V1::ScenariosController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		@project = Project.find_by_api_key(params[:api_key])
		@scenario = @project.scenarios.build(params[:scenario])

		Scenario.transaction do
			begin
				@scenario.save
				render status: :created, json: {response: "success_create #{@scenario.name}", scenario_id: @scenario.id}	
			rescue Exception => e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback			
			end
		end
	end

	def index
		@project = Project.find_by_api_key(params[:api_key])
		@scenarios = @project.scenarios.joins(:records)
		render "scenarios/v1/index"
	end

	def show
		@scenario = Scenario.find(params[:id])
		@record = @scenario.records.first
		render 'scenarios/v1/show'
	end
end