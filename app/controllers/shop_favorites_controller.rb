class ShopFavoritesController < ApplicationController
  def create
    @favorite = ShopFavorite.new(shop_favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to shop_path(@favorite.shop_id)

  end

  def destroy
    @favorite_shop = ShopFavorite.find(params[:id])
    @favorite_shop.destroy
    redirect_to users_authenticated_root_path
  end

  private

  def shop_favorite_params
    params.fetch(:shop_favorite).permit(:shop_id)
  end
end
