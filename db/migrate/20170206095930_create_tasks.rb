class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name, null: false, unique: true
      t.boolean :completed, default: false
      t.references :list
      t.timestamps
    end
  end
end
