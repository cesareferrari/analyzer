require "csv"

class Customer < ApplicationRecord
  include CsvImportable

  validates :username, presence: true

  def name
    [first, last].join(" ")
  end
end
