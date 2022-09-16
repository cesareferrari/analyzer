class ImportProducts
  # Import products from this Etsy file: EtsySoldOrderItems2022.csv
  def call(file)
    options = {key_mapping: {item_name: :name,
                             price: :price,
                             listing_id: :listing_id},
               remove_unmapped_keys: true}

    SmarterCSV.process(file, options) do |row|
      options = row.first # row is an array with 1 hash in it, so we extract the hash itself
      product = Product.find_or_initialize_by(listing_id: options[:listing_id])
      price_cents = (options[:price].to_f * 100).to_i
      product.update(name: options[:name], price_cents: price_cents)
    end
  end
end
