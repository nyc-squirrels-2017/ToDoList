class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task, :null => false
      t.boolean :completed, default: false
      t.references :list

      t.timestamps(null: false)
    end
  end
end
