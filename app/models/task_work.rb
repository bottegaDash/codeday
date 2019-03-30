class TaskWork < ApplicationRecord
  belongs_to :user
  belongs_to :task
  scope :all_tasks, ->(user, t) { where(user_id: user.id) & where(task_id: t.id)}

  def start_time
  end
end
