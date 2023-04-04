class AddRankToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :rank, :integer
  end
end
