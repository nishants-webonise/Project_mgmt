class Task < ActiveRecord::Base

  belongs_to :story

  attr_accessible :task_description, :task_priority, :task_status
end
