class ProductFavoritesController < ApplicationController
  def index
    @favorite_products = ProductFavorite.all
  end

  def new
    @favorite = ProductFavorite.new
  end

  def create
    @favorite = ProductFavorite.new(product_favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to product_path(@favorite.product_id)

  end

  def destroy
    @favorite_product = ProductFavorite.find(params[:id])
    @favorite_product.destroy
    redirect_to users_authenticated_root_path
  end

  private

  def product_favorite_params
    params.fetch(:product_favorite).permit(:product_id)
  end
end
