class Task < ApplicationRecord
  validates_presence_of :description, :company_project_id
  belongs_to :company_project
  # scope :all_tasks, ->(user) { where(user_id: user.id)}
end
