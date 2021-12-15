class ShopFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  scope :check_shop_fav, ->(shop_id, user_id) { where('shop_id = ? AND user_id = ?', shop_id, user_id) }
end
