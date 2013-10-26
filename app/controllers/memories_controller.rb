class MemoriesController < ApplicationController
  def show
  	@report = Report.find(params[:report_id])
  	@memory = @report.memory
  end
end
