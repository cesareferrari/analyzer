require "csv"

class Customer < ApplicationRecord
  include CsvImportable

  validates :username, presence: true
  has_many :orders

  def name
    [first, last].join(" ")
  end

  def page_url
    "https://etsy.com/people/#{username}"
  end
end
