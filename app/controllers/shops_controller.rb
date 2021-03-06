class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]
  before_action :is_seller?, only: %i[new edit update destroy]
  before_action :is_current_seller_for_shop?, only: %i[edit update destroy]

  # GET /shops or /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1 or /shops/1.json
  def show
    @products = @shop.products
    @is_shop_fav = user_signed_in? ? ShopFavorite.check_shop_fav(@shop.id, current_user.id).any? : false
    @favorite = ShopFavorite.new
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit; end

  # POST /shops or /shops.json
  def create
    @shop = current_seller.shops.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def is_seller?
    redirect_to root_path notice: 'permission denied' unless current_seller
  end

  def is_current_seller_for_shop?
    redirect_to root_path notice: 'permission denied' unless current_seller == @shop.seller
  end

  # Only allow a list of trusted parameters through.
  def shop_params
    params.require(:shop).permit(:name, :description, :adress, :seller)
  end
end
