class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :amount, numericality: { greater_than: 0 }
  belongs_to :seller
  belongs_to :shop
end
