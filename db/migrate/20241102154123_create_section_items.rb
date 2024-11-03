class CreateSectionItems < ActiveRecord::Migration[8.0]
  def change
    create_table :section_items do |t|
      t.references :section, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :display_order, null: false
      t.timestamps
    end
    
    # Add unique constraint for section_id and item_id combination
    add_index :section_items, [:section_id, :item_id], unique: true
    # Add index for display_order within a section
    add_index :section_items, [:section_id, :display_order]
  end
end