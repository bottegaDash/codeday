class Task < ApplicationRecord
  validates_presence_of :description, :company_project_id
  belongs_to :company_project
end
