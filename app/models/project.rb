class Project < ActiveRecord::Base

  has_many :users, :through => :user_has_projects
  has_many :stories

  attr_accessible :no_of_members, :project_duration_in_days, :project_name, :project_status
end
