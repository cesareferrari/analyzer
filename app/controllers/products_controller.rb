class ProductsController < ApplicationController
  before_action :require_signin

  def index
    @products = Product.order(:name)
  end

  def import
    file = params[:file]
    return redirect_to welcome_path, notice: "Only CSV files accepted." unless file.content_type == "text/csv"
    ImportProducts.new.call(file)
    redirect_to products_path, notice: "Products imported"
  end
end
