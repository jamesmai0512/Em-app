class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def view
        @employee = Employee.new
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def new
      # Method: GET
      # Mission: Render a form.
      # In a form, you will able to fill in the employee's name.
      # Init an empty object
      # instance variable `@`
      @employee = Employee.new  
    end

    def destroy
      # Find
      # have to find Id
      @employee = Employee.find(params[:id])
      @employee.destroy
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Employee was successfully created.' }
        format.json { head :no_content}
      end 
    end
    
    def update
        @employee = Employee.find(params[:id])
        
        respond_to do |format|  
          if @employee.update(employees_params)
            format.html { redirect_to @employee, notice: 'employee was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end
    

    def create
      @employee = Employee.new(employees_params)
        respond_to do |format|
          byebug
          if @employee.save
            format.html { redirect_to employees_url, notice: 'employee was successfully created.' }
          else
            format.html { render :new }
        end
      end
    end


    private

    def set_employee
        @employee = Employee.find(params[:id])
    end

    def employees_params
        params.require(:employee).permit(:department_id, :project_id, :hourly_rate_id, :name)
    end
end
