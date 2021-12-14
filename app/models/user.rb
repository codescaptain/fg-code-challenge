class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :product_favorites
  has_many :products, through: :product_favorites

  def user_product_fav_list
    Product.where('id IN (?)', product_ids)
  end
end
