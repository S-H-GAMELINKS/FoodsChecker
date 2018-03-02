class FoodtypesController < ApplicationController
  before_action :set_foodtype, only: [:show, :edit, :update, :destroy]

  # GET /foodtypes
  # GET /foodtypes.json
  def index
    @foodtypes = Foodtype.all
  end

  # GET /foodtypes/1
  # GET /foodtypes/1.json
  def show
  end

  # GET /foodtypes/new
  def new
    @foodtype = Foodtype.new
  end

  # GET /foodtypes/1/edit
  def edit
  end

  # POST /foodtypes
  # POST /foodtypes.json
  def create
    @foodtype = Foodtype.new(foodtype_params)

    respond_to do |format|
      if @foodtype.save
        format.html { redirect_to @foodtype, notice: 'Foodtype was successfully created.' }
        format.json { render :show, status: :created, location: @foodtype }
      else
        format.html { render :new }
        format.json { render json: @foodtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foodtypes/1
  # PATCH/PUT /foodtypes/1.json
  def update
    respond_to do |format|
      if @foodtype.update(foodtype_params)
        format.html { redirect_to @foodtype, notice: 'Foodtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @foodtype }
      else
        format.html { render :edit }
        format.json { render json: @foodtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foodtypes/1
  # DELETE /foodtypes/1.json
  def destroy
    @foodtype.destroy
    respond_to do |format|
      format.html { redirect_to foodtypes_url, notice: 'Foodtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foodtype
      @foodtype = Foodtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foodtype_params
      params.require(:foodtype).permit(:name)
    end
end
