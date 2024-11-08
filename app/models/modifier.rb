class Modifier < ApplicationRecord
    belongs_to :item
    belongs_to :modifier_group
  
    validates :display_order, presence: true, numericality: { only_integer: true }
    validates :default_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :price_override, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  end
  