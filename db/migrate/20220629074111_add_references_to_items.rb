class AddReferencesToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :list, foreign_key: true
  end
end
