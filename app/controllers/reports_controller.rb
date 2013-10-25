class ReportsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @reports = @project.reports
  end
  
  def create
  	@project = Project.find(params[:project_id])
    @report = @project.reports.build(params[:report])
    @scenarios = @project.scenarios

    if @report.save
    	redirect_to [@project,@report], notice: "report is created"
		else
			render 'new'
    end
  end

  def show
  	@report = Report.find(params[:id])
    @project = @report.project
  end

  def new
  	@project = Project.find(params[:project_id])
    @report = @project.reports.build
    @scenarios = @project.scenarios
  end
end
