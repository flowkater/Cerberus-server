class MemoriesController < ApplicationController
	before_filter :authenticate_user!
  def show
  	@report = Report.find(params[:report_id])
  	@project = @report.project
  	@memory = @report.memory
  end

  def leak_instance_show
  	@leak_instance = LeakInstance.find(params[:leak_instance_id])
  end
end
