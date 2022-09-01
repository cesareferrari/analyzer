class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first
      t.string :last
      t.string :username

      t.timestamps
    end
  end
end
