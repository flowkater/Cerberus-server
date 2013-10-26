class BatteriesController < ApplicationController
  def show
		@report = Report.find(params[:report_id])
  	@battery = @report.battery
  end
end
