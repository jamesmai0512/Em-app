class DepartmentsController < ApplicationController
  def index
    @department = Department.all
  end

  def new
    @department = Department.new
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
    @department.destroy
    respond_to do |format|
      format.html { redirect_to hourlyrate_url, notice: 'Department was successfully created.' }
      format.json { head :no_content}
    end 
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def departments_params
    params.require(:department).permit(:name)
  end
end
