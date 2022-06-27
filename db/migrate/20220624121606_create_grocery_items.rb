class CreateGroceryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :grocery_items do |t|
      t.string :name
      t.boolean :is_needed

      t.timestamps
    end
  end
end
