class Story < ActiveRecord::Base

  belongs_to :project
  has_many :tasks

  attr_accessible :project_id, :story_description, :story_name, :story_priority, :story_status
end
