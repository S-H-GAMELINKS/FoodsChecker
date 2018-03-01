class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.date :date
      t.string :type
      t.string :place
      t.string :picture

      t.timestamps
    end
  end
end
