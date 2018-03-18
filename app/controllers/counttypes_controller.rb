class CounttypesController < ApplicationController
  before_action :set_counttype, only: [:show, :edit, :update, :destroy]

  # GET /counttypes
  # GET /counttypes.json
  def index
    @counttypes = Counttype.all
  end

  # GET /counttypes/1
  # GET /counttypes/1.json
  def show
  end

  # GET /counttypes/new
  def new
    @counttype = Counttype.new
  end

  # GET /counttypes/1/edit
  def edit
  end

  # POST /counttypes
  # POST /counttypes.json
  def create
    @counttype = Counttype.new(counttype_params)

    respond_to do |format|
      if @counttype.save
        format.html { redirect_to @counttype, notice: 'Counttype was successfully created.' }
        format.json { render :show, status: :created, location: @counttype }
      else
        format.html { render :new }
        format.json { render json: @counttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counttypes/1
  # PATCH/PUT /counttypes/1.json
  def update
    respond_to do |format|
      if @counttype.update(counttype_params)
        format.html { redirect_to @counttype, notice: 'Counttype was successfully updated.' }
        format.json { render :show, status: :ok, location: @counttype }
      else
        format.html { render :edit }
        format.json { render json: @counttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counttypes/1
  # DELETE /counttypes/1.json
  def destroy
    @counttype.destroy
    respond_to do |format|
      format.html { redirect_to counttypes_url, notice: 'Counttype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counttype
      @counttype = Counttype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counttype_params
      params.require(:counttype).permit(:counttype)
    end
end
