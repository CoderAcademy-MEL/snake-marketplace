class Cart < ApplicationRecord
  has_many :cart_listings
  has_many :listings, through: :cart_listings
  belongs_to :user
end
