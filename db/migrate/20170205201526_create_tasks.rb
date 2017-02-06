class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task, null: false
      t.references :list, null: false
      t.boolean :completed, default: false

      t.timestamps
    end
    add_index :tasks, :task, {order: {task: :desc}}
  end
end
