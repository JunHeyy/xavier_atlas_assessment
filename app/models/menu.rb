class Menu < ApplicationRecord
    has_many :menu_sections, dependent: :destroy
    has_many :sections, through: :menu_sections
  
    validates :identifier, presence: true, uniqueness: true
    validates :label, :state, presence: true
    validates :start_date, :end_date, presence: true
  
    # Additional validation to ensure end_date is after start_date
    validate :end_date_after_start_date
  
    private
  
    def end_date_after_start_date
      return if end_date.blank? || start_date.blank?
  
      if end_date < start_date 
        errors.add(:end_date, "must be after the start date")
      end
    end
  end
  