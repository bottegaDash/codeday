class TaskWork < ApplicationRecord
  belongs_to :user
  belongs_to :task
  scope :all_tasks, ->(user, t) { where(user_id: user.id) and where(task_id: t.id)}
end
