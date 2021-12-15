class Sellers::DashboardController < ApplicationController
  before_action :is_seller?, only: %i[index]
  def index
    @products = current_seller.products
    @shops = current_seller.shops
  end


  private

  def is_seller?
    unless seller_signed_in?
      redirect_to root_path notice: "permission denied"
    end
  end
end
