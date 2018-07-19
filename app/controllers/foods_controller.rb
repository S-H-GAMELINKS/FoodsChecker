require 'zbar'
require 'RMagick'
require 'amazon/ecs'

class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_client, only: [:create, :update]
  
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

    respond_to do |format|
      if @food.save

        @food.update(:name => get_barcode_info(@food.picture.path.to_s))

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

        @food.update(:name => get_barcode_info(@food.picture.path.to_s))

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

    def set_s3_client
      @s3 = Aws::S3::Client.new(:region => ENV['AWS_REGION_NAME'],
                                :access_key_id => ENV['AWS_ACCESS_KEY'],
                                :secret_access_key => ENV['AWS_SECRET_KEY'],
            )
    end

    def get_barcode_info(path)
      File.open("./public/temp.jpg","wb") do |file|
        file.write @s3.get_object(:bucket => ENV['AWS_STORAGE_NAME'] , :key => path.to_s).body.read
      end

      # load the image via rmagick
      input = Magick::Image.read('./public/temp.jpg').first

      # convert to PGM
      input.format = 'PGM'

      # load the image from a string
      image = ZBar::Image.from_pgm(input.to_blob)

      image.process.each do |result|
        puts "Code: #{result.data} - Type: #{result.symbology} - Quality: #{result.quality}"
      end

      get_barcode_info(result.data)
    end

    def get_food_info(barcode)
      Amazon::Ecs.configure do |options|
        options[:AWS_access_key_id] = ENV['ECS_ACCESS_KEY']
        options[:AWS_secret_key] = ENV['ECS_SECRET_KEY']
        options[:associate_tag] = ENV['ECS_TAG']
        options[:search_index]      = 'All'                      # 商品種別
        options[:response_group]    = 'Medium'                     # レスポンスに含まれる情報量(ふつう
        options[:country]           = 'jp'                         # 国
      end
    
      res = Amazon::Ecs.item_search(barcode.to_s, :search_index => 'All')
      puts res.get_element('Title').to_s.gsub!(/<Title>|<\/Title>/, "")
    end
end
