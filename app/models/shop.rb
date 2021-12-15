class Shop < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
  belongs_to :seller
  has_many :products

  has_many :shop_favorites
  has_many :users, through: :shop_favorites
end
