class CpusController < ApplicationController
	before_filter :authenticate_user!
  def show
  	@report = Report.find(params[:report_id])
  	@project = @report.project
  	@cpu = @report.cpu
  	@trace_methods = @cpu.trace_methods
  end
end
