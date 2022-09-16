class Product < ApplicationRecord
  validates :name, presence: true
  validates :price_cents, presence: true, numericality: {only_integer: true}
  validates :listing_id, presence: true, uniqueness: true

  def price
    price_cents.to_f / 100
  end

  def url
    "https://www.etsy.com/listing/#{listing_id}"
  end
end
