class NetworksController < ApplicationController
  before_filter :authenticate_user!
  def show
  	@report = Report.find(params[:report_id])
  	@project = @report.project
  	@network = @report.network
  	@latency_methods = @network.latency_methods

  	respond_to do |format|
  		format.html
  		format.json {render json: @latency_methods, only: [:id, :name, :class_name, :latency, :line_number, :request_url]}
  	end
  end
end
