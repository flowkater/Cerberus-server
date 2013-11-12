class Api::V1::CpusController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def show
		@cpu = Cpu.find(params[:id])
		@trace_method = @cpu.trace_methods.first
		render 'cpus/v1/show'
	end
end