class RenameIsNeededToDone < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :is_needed, :done
  end
end
