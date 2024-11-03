class CreateModifierGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :modifier_groups do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.integer :selection_required_min, null: false
      t.integer :selection_required_max, null: false
      t.timestamps
    end
    add_index :modifier_groups, :identifier, unique: true
  end
end
