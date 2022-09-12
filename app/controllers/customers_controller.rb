class CustomersController < ApplicationController
  def index
    @customers = Customer.order(:last)
  end

  def import
    file = params[:file]
    return redirect_to welcome_path, notice: "Only CSV files accepted." unless file.content_type == "text/csv"
    ImportCustomers.new.call(file)
    redirect_to customers_path, notice: "Customers imported"
  end
end
