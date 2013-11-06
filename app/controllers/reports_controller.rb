class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @project = Project.find(params[:project_id])
    @reports = @project.reports
  end
  
  def create
  	@project = Project.find(params[:project_id])
    @report = @project.reports.build(params[:report])

    memory_checked = params[:report][:memory_checked] == "1" ? true : false
    cpu_checked = params[:report][:cpu_checked] == "1" ? true : false
    network_checked = params[:report][:network_checked] == "1" ? true : false
    battery_checked = params[:report][:battery_checked] == "1" ? true : false

    Report.transaction do
      begin
        @report.save
        @report.create_memory if memory_checked
        @report.create_cpu if cpu_checked
        @report.create_network if network_checked
        @report.create_battery if battery_checked 
        session[:report_id] = @report.id
        redirect_to project_profile_steps_path(@project)
      rescue ActiveRecord::RecordInvalid
        render 'new'
        raise ActiveRecord::Rollback 
      end
    end
  end

  def show
  	@report = Report.find(params[:id])

    @memory = @report.memory

    # CPU 
    @cpu = @report.cpu
    @trace_methods = @cpu.trace_methods unless @cpu.nil?

    # Network
    @network = @report.network
    @latency_methods = @network.latency_methods unless @network.nil?

    # Battery
    @battery = @report.battery
    @components = @battery.components unless @battery.nil?
    
    @project = @report.project
  end

  def new
  	@project = Project.find(params[:project_id])
    @report = @project.reports.build
    @scenarios = @project.scenarios
  end
end
