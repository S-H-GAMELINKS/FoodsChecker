class CreateFoodtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :foodtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
