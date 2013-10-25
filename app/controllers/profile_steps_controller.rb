class ProfileStepsController < ApplicationController
	include Wicked::Wizard
	steps :scenario_step, :check_step

	def show
		@project = Project.find(params[:project_id])
		@report = Report.find_by_id(session[:report_id])
		@scenarios = @project.scenarios
		render_wizard
	end

	def update
		@project = Project.find(params[:project_id])
		@report = Report.find_by_id(session[:report_id])
		@report.attributes = params[:report]
		render_wizard @report
	end

	private

	def finish_wizard_path
		@report = Report.find_by_id(session[:report_id])
		@project = @report.project
		project_report_path(@project, @report)
	end
end
