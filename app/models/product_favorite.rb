class ProductFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :check_product_fav, ->(product_id, user_id) { where('product_id = ? AND user_id = ?', product_id, user_id) }
end
