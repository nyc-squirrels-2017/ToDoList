class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.string :task, null: false

      t.timestamps
    end 
  end
end
