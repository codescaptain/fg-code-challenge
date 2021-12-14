class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :is_seller?, only: %i[new edit update destroy]
  before_action :initalize_shops, only: %i[new edit create update]
  before_action :is_current_seller_for_products?, only: %i[edit update destroy]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.seller_id = current_seller.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def is_seller?
    redirect_to root_path notice: 'permission denied' unless current_seller
  end

  def initalize_shops
    @shops = current_seller.shops
  end

  def is_current_seller_for_products?
    redirect_to root_path notice: 'permission denied' unless current_seller == @product.seller
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :amount, :shop_id)
  end
end
