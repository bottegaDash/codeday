class CompanyProject < ApplicationRecord
  validates_presence_of :project, :company_id
  belongs_to :company
  scope :get_project, ->(task) { find_by(id: task.company_project_id)}
end
