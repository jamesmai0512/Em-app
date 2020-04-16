class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new 
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
        # respond_to is a Rails helper method that is attached to the Controller class.
        # It is referencing the response that will be sent to the View (which is going to the browser)
        respond_to do |format|
          # save --> either true or fasle
          # if true -> go to index - /departments
          # if false -> go to new - /departments/new
          if @project.save
            # https://guides.rubyonrails.org/v2.3/routing.html#urls-and-paths
            # departments_url --> http://localhost:3000/departments
            # new_project_url ---> http://localhost:3000/departments/new
            format.html { redirect_to projects_url, notice: 'Project was successfully created.' }
          else
            format.html { render :new }
        end
      end
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    respond_to do |format|
      if @project.update(department_params)
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])

  end

  def destroy
    # Find
    # have to find Id
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
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