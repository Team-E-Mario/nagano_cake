class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :billing_amount
      t.integer :payment_method, null: false, default: 0
      t.integer :freight
      t.integer :status, null: false, default: 0
      t.text :delivery_address
      t.string :delivery_postcode
      t.string :delivery_name
      t.timestamps
    end
  end
end
