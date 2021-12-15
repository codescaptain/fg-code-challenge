class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :product_favorites
  has_many :products, through: :product_favorites

  has_many :shop_favorites
  has_many :shops, through: :shop_favorites

  def user_product_fav_list
    Product.where('id IN (?)', product_ids)
  end

  def user_shop_fav_list
    Shop.where('id IN (?)', shop_ids)
  end
end
