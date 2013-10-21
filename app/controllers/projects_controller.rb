class ProjectsController < ApplicationController
  def exec
    @result = ""
    Dir.chdir("#{Rails.root}/lib/") do
      @result = `lint /Users/flowkater/repo/autoscheduleproto/res/layout/activity_task_edit.xml`
    end
  end

  def index
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
