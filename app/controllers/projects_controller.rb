class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    session[:project] = nil
    @project = current_user.projects.build
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    session[:project] = @project
    @profile_report_number = @project.profile_report_number
    @report_latest_appversion = @project.report_latest_appversion
    @reports_period = @project.reports_period
    @scenarios = @project.scenarios.limit(5)
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to @project, notice: "Project is created"
    else
      render action: "index"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  # def exec
  #   @result = ""
  #   Dir.chdir("#{Rails.root}/lib/") do
  #     @result = `lint /Users/flowkater/repo/autoscheduleproto/res/layout/activity_task_edit.xml`
  #   end
  # end
end
