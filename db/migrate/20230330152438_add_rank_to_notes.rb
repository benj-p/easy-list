class AddRankToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :rank, :integer
  end
end
