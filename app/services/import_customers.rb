class ImportCustomers
  # Import customers from this Etsy file: EtsySoldOrders2022.csv
  def call(file)
    options = {key_mapping: {first_name: :first,
                             last_name: :last,
                             buyer_user_id: :username,
                             street_1: :address1,
                             street_2: :address2,
                             delivery_city: :city,
                             delivery_state: :state,
                             delivery_zipcode: :zip,
                             delivery_country: :country},
               remove_unmapped_keys: true}

    # Test data in db/data/customers-partial.csv
    SmarterCSV.process(file, options) do |row|
      options = row.first # row is an array with 1 hash in it, so we extract the hash itself
      customer = Customer.find_or_initialize_by(username: options[:username])
      customer.update(options)
    end
  end
end
