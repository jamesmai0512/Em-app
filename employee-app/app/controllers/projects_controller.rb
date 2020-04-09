class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new 
    @project = Project.new
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to project_url, notice: 'Project was successfully created.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :manager, :budget, :code)
  end

end