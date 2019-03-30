class CreateTaskWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :task_works do |t|
      t.datetime :time_worked
      t.integer :time_count
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
