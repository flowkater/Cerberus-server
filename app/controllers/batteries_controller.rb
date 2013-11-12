class BatteriesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
		@report = Report.find(params[:report_id])
		@project = @report.project
  	@battery = @report.battery
  	@components = @battery.components

  	respond_to do |format|
  		format.html
      format.json {render json: {id: @battery.id, children: @components}.to_json}
  	end
  end
end
