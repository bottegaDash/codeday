class CompanyProject < ApplicationRecord
  validates_presence_of :project, :company_id
  belongs_to :company
end
