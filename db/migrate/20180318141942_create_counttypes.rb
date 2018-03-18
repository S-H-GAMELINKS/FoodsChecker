class CreateCounttypes < ActiveRecord::Migration[5.2]
  def change
    create_table :counttypes do |t|
      t.string :counttype

      t.timestamps
    end
  end
end
