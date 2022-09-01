class Customer < ApplicationRecord
  validates :username, presence: true
end
