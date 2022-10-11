class Order < ApplicationRecord
  belongs_to :customer
  has_many :line_items

  def value
    value_cents.to_f / 100
  end

  def discount
    discount_cents.to_f / 100
  end

  def card_processing_fees
    card_processing_fees_cents.to_f / 100
  end

  def total
    total_cents.to_f / 100
  end

  def net
    net_cents.to_f / 100
  end

  def self.total_net
    sum(:net_cents).to_f / 100
  end

  def self.average_net
    average(:net_cents).to_i.to_f / 100
  end
end
