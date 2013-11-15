# encoding: UTF-8
class Api::V1::RecordsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		@scenario = Scenario.find(params[:scenario_id])
		@records = @scenario.records.build(JSON.parse(params[:records]))

		Record.transaction do
			begin
				Record.import @records
				@scenario.record_node_update
				render status: :created, json: {response: "success create"}	
			rescue Exception => e
				print e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback
			end			
		end
	end
end