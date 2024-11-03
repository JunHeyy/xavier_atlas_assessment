class CreateModifiers < ActiveRecord::Migration[8.0]
  def change
    create_table :modifiers do |t|
      t.references :item, null: false, foreign_key: true
      t.references :modifier_group, null: false, foreign_key: true
      t.integer :display_order, null: false
      t.integer :default_quantity, null: false
      t.decimal :price_override, precision: 10, scale: 2
      t.timestamps
    end
    
    # Add unique constraint for item and modifier_group combination
    add_index :modifiers, [:item_id, :modifier_group_id], unique: true
    # Add index for display_order within a modifier_group
    add_index :modifiers, [:modifier_group_id, :display_order]
  end
end