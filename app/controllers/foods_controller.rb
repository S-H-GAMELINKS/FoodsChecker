class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  
  PER = 10

  # GET /foods
  # GET /foods.json
  def index
    @search = Food.search(params[:q])
    @foods = @search.result.page(params[:page]).per(PER)
  end
  
  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    puts get_food_barcode(@food.picture)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Food.import(params[:file])
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :date, :food, :place, :picture, :count, :counttype)
    end

    def get_food_barcode(filename)

      file = filename
      image = Magick::ImageList.new(file)
  
      puts image[0].write(file + ".png")
  
      img = Magick::Image.read(file + ".png").first
      pgm = img.to_blob { |attrs| attrs.format = 'PGM' }
      zbar_image = ZBar::Image.from_pgm(pgm)
      symbols = zbar_image.process
      puts symbols.inspect  
    end
end
