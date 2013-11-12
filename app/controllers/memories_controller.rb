class MemoriesController < ApplicationController
	before_filter :authenticate_user!
  def show
  	@report = Report.find(params[:report_id])
  	@project = @report.project
  	@memory = @report.memory
  end
end
