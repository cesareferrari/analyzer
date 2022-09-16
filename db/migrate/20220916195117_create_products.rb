class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price_cents, null: false, default: 0
      t.string :listing_id, null: false

      t.timestamps
    end
  end
end
