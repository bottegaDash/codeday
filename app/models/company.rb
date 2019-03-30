class Company < ApplicationRecord
  validates_presence_of :name
  scope :get_company, ->(project) { find_by(id: project.company_id)}
end
