class EmsController < ApplicationController
  before_action :set_em, only: [:show, :edit, :update, :destroy]

  # GET /ems
  # GET /ems.json
  def index
    @ems = Em.all
  end

  # GET /ems/1
  # GET /ems/1.json
  def show
  end

  # GET /ems/new
  def new
    @em = Em.new
  end

  # GET /ems/1/edit
  def edit
  end

  # POST /ems
  # POST /ems.json
  def create
    @em = Em.new(em_params)

    respond_to do |format|
      if @em.save
        format.html { redirect_to @em, notice: 'Em was successfully created.' }
        format.json { render :show, status: :created, location: @em }
      else
        format.html { render :new }
        format.json { render json: @em.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ems/1
  # PATCH/PUT /ems/1.json
  def update
    respond_to do |format|
      if @em.update(em_params)
        format.html { redirect_to @em, notice: 'Em was successfully updated.' }
        format.json { render :show, status: :ok, location: @em }
      else
        format.html { render :edit }
        format.json { render json: @em.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ems/1
  # DELETE /ems/1.json
  def destroy
    @em.destroy
    respond_to do |format|
      format.html { redirect_to ems_url, notice: 'Em was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_em
      @em = Em.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def em_params
      params.require(:em).permit(:name, :department, :price)
    end
end
