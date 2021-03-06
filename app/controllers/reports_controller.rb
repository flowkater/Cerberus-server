class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @project = Project.find(params[:project_id])
    @search = @project.reports.is_completed.search(appversion_in: params[:appversions], osversion_in: params[:osversions],memory_eq: params[:memory], cpu_eq: params[:cpu], network_eq: params[:network],battery_eq: params[:battery], scenario_test_eq: params[:scenario], error_status_eq: params[:status])
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

    @appversions = params[:appversions]
    @osversion = params[:osversions]
    @memory = params[:memory]
    @cpu = params[:cpu]
    @network = params[:network]
    @battery = params[:battery]
    @scenario_test = params[:scenario]
    @error_status = params[:status]
    
    respond_to do |format|
      format.json {render json: {app: @reports_app_version_count ,os: @reports_os_version_count, appversions: @appversions,osversions: @osversion, memory: @memory, cpu: @cpu, network: @network, battery: @battery, scenario_test: @scenario_test, error_status: @error_status  }}
    end
  end
end
