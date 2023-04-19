class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :name
      t.integer :sale_status, null: false, default: true
      t.text :introduction
      t.integer :price_without_tax
      t.timestamps
    end
  end
end
