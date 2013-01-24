class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :story_name
      t.string :story_description
      t.string :story_status
      t.string :story_priority
      t.references :project
      #t.integer :project_id

      t.timestamps
    end
  end
end
