class Item < ApplicationRecord
  belongs_to :list
  
  attribute :done, default: false, inclusion: { in: [true, false] }
  validates :name, presence: { message: "Item cannot be blank" }, uniqueness: { scope: :list_id, message: "Item already exists" }

  scope :done, -> { where(done: true) }
  scope :not_done, -> { where(done: false) }
end