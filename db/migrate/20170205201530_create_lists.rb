class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.references :user, null: false

      t.timestamps
    end
    add_index :lists, :name, {order: {name: :desc}}
  end
end
