class Item < ApplicationRecord
  # Associations
  has_many :modifiers, dependent: :destroy
  has_many :section_items, dependent: :destroy
  has_many :sections, through: :section_items
  
  # Add these new associations
  has_many :item_modifier_groups, dependent: :destroy
  has_many :modifier_groups, through: :item_modifier_groups

  # Validations
  validates :identifier, presence: true, uniqueness: true
  validates :label, :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :item_type, presence: true
end