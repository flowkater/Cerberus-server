class ReportsController < ApplicationController
  def index
  end
  
  def create
  	session[:report_params].deep_merge!(params[:report]) if params[:report]
  	@project = Project.find(params[:project_id])
  	@scenarios = @project.scenarios
    @report = @project.reports.build(params[:report_params])
    @report.current_step = session[:report_step]
    if params[:back_button]
    	@report.previous_button
    elsif @report.last_step?
    	@report.save
    else
    	@report.next_step	
    end
    session[:report_step] = @report.current_step

    if @report.new_record?
    	render "projects/select_category_profile"
    else
    	session[:report_step] = session[:report_params] = nil
    	flash[:notice] = "Report saved."
    	redirect_to @report
    end
  end

  def show
  	
  end
end
