class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.text :address
      t.string :postcode
      t.string :name
      t.integer :customer_id
      t.timestamps
    end
  end
end
