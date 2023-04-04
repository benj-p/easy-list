class Note < ApplicationRecord
  include Rankable

  belongs_to :user
end
