class PlacetypesController < ApplicationController
  before_action :set_placetype, only: [:show, :edit, :update, :destroy]

  PER = 10

  # GET /placetypes
  # GET /placetypes.json
  def index
    @placetypes = Placetype.page(params[:page]).per(PER)
  end

  # GET /placetypes/1
  # GET /placetypes/1.json
  def show
  end

  # GET /placetypes/new
  def new
    @placetype = Placetype.new
  end

  # GET /placetypes/1/edit
  def edit
  end

  # POST /placetypes
  # POST /placetypes.json
  def create
    @placetype = Placetype.new(placetype_params)

    respond_to do |format|
      if @placetype.save
        format.html { redirect_to @placetype, notice: 'Placetype was successfully created.' }
        format.json { render :show, status: :created, location: @placetype }
      else
        format.html { render :new }
        format.json { render json: @placetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /placetypes/1
  # PATCH/PUT /placetypes/1.json
  def update
    respond_to do |format|
      if @placetype.update(placetype_params)
        format.html { redirect_to @placetype, notice: 'Placetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @placetype }
      else
        format.html { render :edit }
        format.json { render json: @placetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /placetypes/1
  # DELETE /placetypes/1.json
  def destroy
    @placetype.destroy
    respond_to do |format|
      format.html { redirect_to placetypes_url, notice: 'Placetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Placetype.import(params[:file])
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_placetype
      @placetype = Placetype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def placetype_params
      params.require(:placetype).permit(:name)
    end
end
