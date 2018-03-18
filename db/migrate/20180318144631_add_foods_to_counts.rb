class AddFoodsToCounts < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :count, :integer
    add_column :foods, :counttype, :string
  end
end
