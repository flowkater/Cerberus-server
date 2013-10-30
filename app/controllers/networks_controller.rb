class NetworksController < ApplicationController
  def show
  	@report = Report.find(params[:report_id])
  	@project = @report.project
  	@network = @report.network
  	@latency_methods = @network.latency_methods
  end
end
