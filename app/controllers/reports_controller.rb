class ReportsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @project = Project.find(params[:project_id])
    @reports = @project.reports
  end

  def show
  	@report = Report.find(params[:id])

    @memory = @report.memory
    @leak_instances = @memory.leak_instances unless @memory.nil?

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
end
