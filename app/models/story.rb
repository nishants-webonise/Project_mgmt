class Story < ActiveRecord::Base

  belongs_to :project
  has_many :tasks

  attr_accessible :story_description, :story_name, :story_priority, :story_status
end
