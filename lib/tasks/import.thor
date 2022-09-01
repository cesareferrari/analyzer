require "csv"

class Import < Thor
  desc "customers", "Import customers from CSV"
  def customers(csv_file)
    require File.expand_path("config/environment")

    count = 1

    puts "[ Thor ] Importing customers from #{csv_file}\n\n"

    CSV.foreach("#{Rails.root}/db/data/#{csv_file}", headers: true) do |row|
      # "Buyer User ID", "First Name", "Last Name"

      values = {first: row["First Name"], last: row["Last Name"]}
      customer = Customer.find_or_initialize_by(username: row["Buyer User ID"])

      if customer.persisted?
        puts "[ Thor ] #{count}: updating #{customer.username}."
      else
        puts "[ Thor ] #{count}: creating #{customer.username}."
      end

      customer.update(values)

      count += 1
    end

    puts "[ Thor ] Done! "
    puts "\n[ Thor ] Imported #{count} customers.\n\n"
  end
end
