class ScenariosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@project = Project.find(params[:project_id])
  	@scenarios = @project.scenarios
  end

  def new
  	@project = Project.find(params[:project_id])
  end

  def show
  	@scenario = Scenario.find(params[:id])
    @project = @scenario.project
  end

  def destroy
 		@scenario = Scenario.find(params[:id])
    @project = @scenario.project
 		@scenario.destroy

 		redirect_to project_scenarios_path(@project)
  end
end
