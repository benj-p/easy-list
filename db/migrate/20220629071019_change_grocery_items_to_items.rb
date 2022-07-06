class ChangeGroceryItemsToItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :grocery_items, :items
  end
end
