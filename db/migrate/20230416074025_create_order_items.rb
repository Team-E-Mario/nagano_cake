class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
      t.integer :product_status, null: false, default: 0
      t.integer :purchase_price
      t.timestamps
    end
  end
end
