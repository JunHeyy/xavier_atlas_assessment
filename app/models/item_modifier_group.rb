class ItemModifierGroup < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group

  validates :item_id, uniqueness: { scope: :modifier_group_id }
end