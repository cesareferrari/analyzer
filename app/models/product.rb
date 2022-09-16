class Product < ApplicationRecord
  validates :name, presence: true
  validates :price_cents, presence: true, numericality: {only_integer: true}
  validates :listing_id, presence: true, uniqueness: true
end
