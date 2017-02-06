class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null:false
      t.references :list, null:false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
