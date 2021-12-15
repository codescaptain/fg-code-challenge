class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :amount, numericality: { greater_than: 0 }

  has_many :product_favorites
  has_many :users, through: :product_favorites

  belongs_to :seller
  belongs_to :shop
end
