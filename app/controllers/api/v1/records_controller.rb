# encoding: UTF-8
class Api::V1::RecordsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		@scenario = Scenario.find(params[:scenario_id])
		@records = @scenario.records.build(JSON.parse(params[:records]))

		# 레코딩 children 노드 작업해주기 
		(0..@records.length - 1).each do |i|
			next if i == 0
			@records[i].parent_id = @records[i-1].id
		end

		Record.transaction do
			begin
				Record.import @records
				render status: :created, json: {response: "success create"}	
			rescue Exception => e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback
			end			
		end
	end
end