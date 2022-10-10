class LineItemsController < ApplicationController
  def index
  end

  def import
    file = params[:file]
    return redirect_to welcome_path, notice: "Only CSV files accepted." unless file.content_type == "text/csv"
    ImportLineItems.new.call(file)
    redirect_to line_items_path, notice: "Line Items imported"
  end
end
