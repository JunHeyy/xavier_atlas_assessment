class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.text :description, null: false
      t.decimal :price, null: false, precision: 10, scale: 2
      t.integer :item_type, null: false  
      t.timestamps
    end
    add_index :items, :identifier, unique: true
    add_index :items, :item_type  # Add this index
  end
end