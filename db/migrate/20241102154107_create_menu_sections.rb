class CreateMenuSections < ActiveRecord::Migration[8.0]
  def change
    create_table :menu_sections do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.integer :display_order, null: false
      t.timestamps
    end
    
    # Add unique constraint for menu_id and section_id combination
    add_index :menu_sections, [:menu_id, :section_id], unique: true
    # Add index for display_order within a menu
    add_index :menu_sections, [:menu_id, :display_order]
  end
end