class CustomersController < ApplicationController
  include Pagination

  CUSTOMERS_PER_PAGE = 30

  def index
    @pagination, @customers = paginate(collection: Customer.order(:last), params: page_params)
  end

  def import
    file = params[:file]
    return redirect_to welcome_path, notice: "Only CSV files accepted." unless file.content_type == "text/csv"
    ImportCustomers.new.call(file)
    redirect_to customers_path, notice: "Customers imported"
  end

  private

  def page_params
    params.permit(:page).merge(per_page: CUSTOMERS_PER_PAGE)
  end
end
