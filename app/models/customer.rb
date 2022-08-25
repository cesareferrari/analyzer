class Customer < ApplicationRecord
  validates :name, :username, presence: true
end
