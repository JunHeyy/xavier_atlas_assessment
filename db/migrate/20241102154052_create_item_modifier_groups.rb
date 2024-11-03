class CreateItemModifierGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :item_modifier_groups do |t|
      t.references :item, null: false, foreign_key: true
      t.references :modifier_group, null: false, foreign_key: true
      t.timestamps
    end
    
    # Add unique constraint for item_id and modifier_group_id combination
    add_index :item_modifier_groups, [:item_id, :modifier_group_id], unique: true
  end
end