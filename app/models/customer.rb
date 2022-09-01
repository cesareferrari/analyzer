class Customer < ApplicationRecord
  validates :username, presence: true

  def name
    [first, last].join(" ")
  end
end
