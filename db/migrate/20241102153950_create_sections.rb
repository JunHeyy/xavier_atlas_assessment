class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.text :description, null: false
      t.timestamps
    end
    add_index :sections, :identifier, unique: true
  end
 end
 