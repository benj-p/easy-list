class GroceryItem < ApplicationRecord
  attribute :is_needed, default: true, inclusion: { in: [true, false] }
  validates :name, presence: true

  scope :needed, -> { where(is_needed: true) }
  scope :not_needed, -> { where(is_needed: false) }
end