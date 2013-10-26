class NetworksController < ApplicationController
  def show
  	@report = Report.find(params[:report_id])
  	@network = @report.network
  end
end
