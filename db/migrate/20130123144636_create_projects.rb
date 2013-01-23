class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_status
      t.integer :project_duration_in_days
      t.integer :no_of_members

      t.timestamps
    end
  end
end
