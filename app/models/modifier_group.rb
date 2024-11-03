class ModifierGroup < ApplicationRecord
  # Associations
  has_many :modifiers, dependent: :destroy
  has_many :item_modifier_groups, dependent: :destroy
  has_many :items, through: :item_modifier_groups
  
  # Validations
  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :selection_required_min, :selection_required_max, 
            presence: true, 
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  validate :min_less_than_or_equal_to_max
  
  private
  
  def min_less_than_or_equal_to_max
    return if selection_required_min.nil? || selection_required_max.nil?
  
    if selection_required_min > selection_required_max
      errors.add(:selection_required_min, "cannot be greater than selection_required_max")
    end
  end
end