class ScenariosController < ApplicationController
  def index
  	@project = Project.find(params[:project_id])
  	@scenarios = @project.scenarios
  end

  def new
  	
  end

  def destroy
 		@scenario = Scenario.find(params[:id])
 		@scenario.destroy

 		redirect_to scenarios_url
  end
end
