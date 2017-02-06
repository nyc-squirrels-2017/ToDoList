class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.references :users, null: false
      
      t.time
    end
  end
end
