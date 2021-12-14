class PagesController < ApplicationController
  def welcome
    @products = Product.all
  end
end
