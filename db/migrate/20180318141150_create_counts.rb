class CreateCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :counts do |t|
      t.integer :count

      t.timestamps
    end
  end
end
