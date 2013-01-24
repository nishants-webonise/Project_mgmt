class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_description
      t.string :task_status
      t.string :task_priority
      t.references :story
      #t.integer :story_id

      t.timestamps
    end
  end
end
