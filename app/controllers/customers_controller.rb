class CustomersController < ApplicationController
  def index
    @customers = Customer.order(:last)
  end
end
