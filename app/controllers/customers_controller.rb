class CustomersController < ApplicationController
  def index
    @customers = Customer.order(:last)
  end

  def import
    file = params[:file]
    return redirect_to welcome_path, notice: "Only CSV files accepted." unless file.content_type == "text/csv"

    options = {key_mapping: {first_name: :first, last_name: :last, buyer_user_id: :username}, remove_unmapped_keys: true}

    # Test data in db/data/customers-partial.csv
    SmarterCSV.process(file, options) do |row|
      options = row.first # row is an array with 1 hash in it, so we extract the hash itself
      customer = Customer.find_or_initialize_by(username: options[:username])
      customer.update(options)
    end

    # file = File.open(file)

    # count = 0
    # CSV.foreach(file, headers: true) do |row|
    #   # "Buyer User ID", "First Name", "Last Name"
    #   values = {first: row["First Name"], last: row["Last Name"]}
    #   customer = Customer.find_or_initialize_by(username: row["Buyer User ID"])

    #   unless customer.persisted?
    #     count += 1
    #   end

    #   customer.update(values)
    # end

    # binding.b

    redirect_to customers_path, notice: "Customers imported"
  end
end
