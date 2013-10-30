class BatteriesController < ApplicationController
  def show
		@report = Report.find(params[:report_id])
		@project = @report.project
  	@battery = @report.battery
  	@components = @battery.components
  end
end
