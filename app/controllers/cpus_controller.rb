class CpusController < ApplicationController
  def show
  	@report = Report.find(params[:report_id])
  	@cpu = @report.cpu
  end
end
