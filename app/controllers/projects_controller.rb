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
    @scenarios = @project.scenarios.top4
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to @project, notice: "Project is created"
    else
      render action: "index"
    end
  end

  def trend_memory
    @project = Project.find(params[:project_id])
    @reports_trend_memory = @project.reports_trend_memory
    respond_to do |format|
      format.json {render json: @reports_trend_memory}
    end
  end

  def trend_cpu
    @project = Project.find(params[:project_id])
    @reports_trend_cpu = @project.reports_trend_cpu
    respond_to do |format|
      format.json {render json: @reports_trend_cpu}
    end
  end

  def trend_network
    @project = Project.find(params[:project_id])
    @reports_trend_network = @project.reports_trend_network
    respond_to do |format|
      format.json {render json: @reports_trend_network}
    end
  end

  def trend_battery
    @project = Project.find(params[:project_id])
    @reports_trend_battery = @project.reports_trend_battery
    respond_to do |format|
      format.json {render json: @reports_trend_battery}
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
