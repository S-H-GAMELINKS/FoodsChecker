class RenameTypeColumnToFoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :foods, :type, :food
  end
end
