class Task < ActiveRecord::Base

  belongs_to :story

  attr_accessible :story_id, :task_description, :task_priority, :task_status
end
