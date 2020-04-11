class HourlyratesController < ApplicationController
  def index
      @hourlyrates = HourlyRate.all
    end

    def show
    end
    
    def new
      @hourlyrate = HourlyRate.new
    end
    
    def create
      @hourlyrate = HourlyRate.new(hourlyrate_params)
        # respond_to is a Rails helper method that is attached to the Controller class.
        # It is referencing the response that will be sent to the View (which is going to the browser)
        respond_to do |format|
          # save --> either true or fasle
          # if true -> go to index - /departments
          # if false -> go to new - /departments/new
          if @hourlyrate.save
            # https://guides.rubyonrails.org/v2.3/routing.html#urls-and-paths
            # departments_url --> http://localhost:3000/departments
            # new_hourlyrate_url ---> http://localhost:3000/departments/new
            format.html { redirect_to hourlyrates_url, notice: 'Hourly Rate was successfully created.' }
          else
            format.html { render :new }
        end
      end
    end
    
    def destroy
      @hourlyrate = HourlyRate.find(params[:id])
      @hourlyrate.destroy
      respond_to do |format|
        format.html { redirect_to hourlyrates_url, notice: 'Hourly Rate was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    
    
    
    private
    
    def set_hourlyrate
      @hourlyrate = HourlyRate.find(params[:id])
    end
    
    def hourlyrate_params
      params.require(:hourlyrate).permit(:rate)
    end
end
