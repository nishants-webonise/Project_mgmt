class RemoveProjectDurationInDaysFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :project_duration_in_days
  end

  def down
    add_column :projects, :project_duration_in_days, :integer
  end
end
