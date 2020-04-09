class HourlyratesController < ApplicationController
  def index
      @hourlyrate = HourlyRate.all
    end
    
    def new
      @hourlyrate = HourlyRate.new
    end
    
    def create
      @hourlyrate = HourlyRate.new(hourlyrate_params)

      if @hourlyrate.save
        redirect_to @hourlyrate
      else
        render 'new'
      end
    end
    
    def show
    end
    
    def update

    end
    
    def edit
    end
    
    def destroy
      @hourlyrate.destroy
      respond_to do |format|
        format.html { redirect_to hourlyrate_url, notice: 'Hourly Rate was successfully created.' }
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
