module Rankable
  extend ActiveSupport::Concern

  included do
    before_create :add_rank
    scope :ordered_by_rank, -> { order(rank: :asc) }
  end

  def add_rank
    user_items = self.class.where(user: user)
    self.rank = user_items.present? ? user_items.pluck(:rank).max + 1 : 1
  end
end