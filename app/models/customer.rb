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

  def self.returning
    customers = []

    Order.group(:customer_id).count.each do |id, count|
      if count > 1
        customers << Customer.find(id)
      end
    end

    customers
  end
end
