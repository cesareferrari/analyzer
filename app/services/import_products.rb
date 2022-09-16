class ImportProducts
  # Import products from this Etsy file: EtsySoldOrderItems2022.csv
  def call(file)
    options = {key_mapping: {item_name: :name,
                             price: :price_cents,
                             listing_id: :listing_id},
               remove_unmapped_keys: true}

    SmarterCSV.process(file, options) do |row|
      options = row.first # row is an array with 1 hash in it, so we extract the hash itself
      product = Product.find_or_initialize_by(listing_id: options[:listing_id])
      product.update(options)
    end
  end
end
