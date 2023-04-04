class List < ApplicationRecord
  include Rankable

  has_many :items, dependent: :destroy
  belongs_to :user  
end