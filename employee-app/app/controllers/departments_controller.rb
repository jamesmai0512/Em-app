class DepartmentsController < ApplicationController
  def index
    @departments = Department.all # return array
  end

  def new
    # Method: GET
    # Mission: Render a form.
    # In a form, you will able to fill in the department's name.
    # Init an empty object
    # instance variable `@`
    @department = Department.new
  end

  def create
    @department = Department.new(departments_params)
    
    # respond_to is a Rails helper method that is attached to the Controller class.
    # It is referencing the response that will be sent to the View (which is going to the browser)
    respond_to do |format|
      # save --> either true or fasle
      # if true -> go to index - /departments
      # if false -> go to new - /departments/new
      if @department.save
        # https://guides.rubyonrails.org/v2.3/routing.html#urls-and-paths
        # departments_url --> http://localhost:3000/departments
        # new_hourlyrate_url ---> http://localhost:3000/departments/new
        format.html { redirect_to departments_url, notice: 'Department was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    # Detail page
    @department = Department.find(params[:id])
  end
  
  def update
    @department = Department.find(params[:id])
    respond_to do |format|
      if @department.update(departments_params)
        format.html { redirect_to @department, notice: 'department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def destroy
    # Find
    # have to find Id
    @department = Department.find(params[:id])
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully created.' }
      format.json { head :no_content}
    end 
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def departments_params
    # Strong Parameter
    # https://api.rubyonrails.org/classes/ActionController/Parameters.html
    params.require(:department).permit(:name)
  end
end
