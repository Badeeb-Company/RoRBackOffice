class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10).order("id ASC")
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def import
  end

  def do_import
    zip_file = params[:file]
    if zip_file.blank?
      flash[:error] = 'Please select zip file to upload products'
      render :import
    else
      Zip::File.open(zip_file.path) do |file|
        Product.destroy_all
        file.each do |entry|
          entry.extract(Rails.root.join('public', entry.name))
          temp_file = File.new(Rails.root.join('public', entry.name))
          Product.create(photo: temp_file)
          File.delete(Rails.root.join('public', entry.name))
        end
      end
      redirect_to products_url, notice: 'Products imported successfully.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :photo)
    end
end
