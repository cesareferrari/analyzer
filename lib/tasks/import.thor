require 'csv'

class Import < Thor
  desc "customers", "Import customers from CSV"
  def customers(csv_file)
    require File.expand_path('config/environment')

    count = 1

    puts "[ Thor ] Importing customers from #{csv_file}\n\n"

    CSV.foreach("#{Rails.root}/db/data/#{csv_file}",
        headers: true) do |row|
      puts "[ Thor ] #{count}: #{row['Buyer']} - #{row['Delivery Name']}"
      count += 1
    end

    puts "[ Thor ] Done! "
    puts "\n[ Thor ] Imported #{count} customers.\n\n"
  end
end
