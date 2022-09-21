class OrdersController < ApplicationController
  before_action :require_signin

  def index
    @orders = Order.order(date: :desc)
  end

  def import
    file = params[:file]
    return redirect_to welcome_path, notice: "Only CSV files accepted." unless file.content_type == "text/csv"
    ImportOrders.new.call(file)
    redirect_to orders_path, notice: "Orders imported"
  end
end
