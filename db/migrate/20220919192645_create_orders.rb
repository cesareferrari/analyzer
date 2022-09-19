class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.string :etsy_order_id, default: ""
      t.string :coupon_code, default: ""
      t.integer :value_cents, default: 0
      t.integer :discount_cents, default: 0
      t.integer :total_cents, default: 0
      t.integer :card_processing_fees_cents, default: 0
      t.integer :net_cents, default: 0
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
