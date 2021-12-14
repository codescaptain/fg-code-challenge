class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shops
  has_many :products

  def username_from_email
    # example@gmal.com -> [example, gmail.com] -> example -> Example
    email.split('@')[0].capitalize
  end
end
