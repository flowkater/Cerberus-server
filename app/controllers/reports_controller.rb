class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @project = Project.find(params[:project_id])
    @search = @project.reports.is_completed.search(appversion_in: params[:appversions], osversion_in: params[:osversions],memory_checked_eq: params[:memory], cpu_checked_eq: params[:cpu], network_checked_eq: params[:network],battery_checked_eq: params[:battery], scenario_test_eq: params[:scenario], error_status_eq: params[:status])
    @reports = @search.result.page(params[:page]).per(10)
  end

  def show
  	@report = Report.find(params[:id])

    @scenario = @report.scenario

    @memory = @report.memory
    @leak_instances = @memory.leak_instances.includes(:children) unless @memory.nil?

    # CPU 
    @cpu = @report.cpu
    @trace_methods = @cpu.trace_methods.includes(:children) unless @cpu.nil?

    # Network
    @network = @report.network
    @latency_methods = @network.latency_methods unless @network.nil?

    # Battery
    @battery = @report.battery
    @components = @battery.components unless @battery.nil?
    
    @project = @report.project
  end

  def app_os_version_count
    @project = Project.find(params[:project_id])
    @reports_app_version_count = @project.reports_app_version_count
    @reports_os_version_count = @project.reports_os_version_count
    
    respond_to do |format|
      format.json {render json: {app: @reports_app_version_count ,os: @reports_os_version_count}}
    end
  end
end
