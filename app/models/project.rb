class Project < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :stories

  attr_accessible :no_of_members, :project_duration_in_days, :project_name, :project_status, :user_id
end
