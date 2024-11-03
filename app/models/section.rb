class Section < ApplicationRecord
    has_many :menu_sections, dependent: :destroy
    has_many :menus, through: :menu_sections
    has_many :section_items
    has_many :items, through: :section_items
  
    validates :identifier, presence: true, uniqueness: true
    validates :label, :description, presence: true
  end