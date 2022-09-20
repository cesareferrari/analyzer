class ImportOrders
  # Import products from this Etsy file: EtsySoldOrders2022.csv
  def call(file)
    options = {key_mapping: {sale_date: :date,
                             order_id: :etsy_order_id,
                             coupon_code: :coupon_code,
                             discount_amount: :discount_cents,
                             card_processing_fees: :card_processing_fees_cents,
                             order_value: :value_cents,
                             order_total: :total_cents,
                             order_net: :net_cents,
                             buyer_user_id: :username},
               remove_unmapped_keys: true}

    SmarterCSV.process(file, options) do |row|
      options = row.first # row is an array with 1 hash in it, so we extract the hash itself
      customer = Customer.find_by(username: options[:username])
      order = Order.find_or_initialize_by(etsy_order_id: options[:etsy_order_id])

      value_cents = (options[:value_cents].to_f * 100).to_i
      discount_cents = (options[:discount_cents].to_f * 100).to_i
      total_cents = (options[:total_cents].to_f * 100).to_i
      card_processing_fees_cents = (options[:card_processing_fees_cents].to_f * 100).to_i
      net_cents = (options[:net_cents].to_f * 100).to_i
      date = DateTime.strptime(options[:date], "%m/%d/%y")

      order.update(date: date,
        coupon_code: options[:coupon_code],
        value_cents: value_cents,
        discount_cents: discount_cents,
        total_cents: total_cents,
        card_processing_fees_cents: card_processing_fees_cents,
        net_cents: net_cents,
        customer: customer)
    end
  end
end
