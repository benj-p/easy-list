class RankingController < ApplicationController
  def update_all
    klass = params["class"].constantize
    params["ranks"].each do |id, rank|
      klass.find(id).update(rank: rank + 1)
    end
  end
end
