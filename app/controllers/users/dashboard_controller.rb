class Users::DashboardController < ApplicationController
  def index
    @fav_products = current_user.user_product_fav_list
  end
end
