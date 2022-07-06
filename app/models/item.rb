class Item < ApplicationRecord
  belongs_to :list
  
  attribute :done, default: false, inclusion: { in: [true, false] }
  validates :name, presence: true

  scope :done, -> { where(done: true) }
  scope :not_done, -> { where(done: false) }
end