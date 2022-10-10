class ImportLineItems
  # Import line items from this Etsy file: EtsySoldOrderItems2022.csv
  def call(file)
    options = {key_mapping: {quantity: :quantity,
                             price: :price,
                             listing_id: :listing_id,
                             order_id: :order_id},
               remove_unmapped_keys: true}

    SmarterCSV.process(file, options) do |row|
      options = row.first # row is an array with 1 hash in it, so we extract the hash itself
      order = Order.find_by(etsy_order_id: options[:order_id])
      product = Product.find_by(listing_id: options[:listing_id])
      price_cents = (options[:price].to_f * 100).to_i
      quantity = options[:quantity]

      if order && product
        line_item = LineItem.find_or_initialize_by(order: order, product: product)
        line_item.update(price_cents: price_cents, quantity: quantity)
      end
    end
  end
end
