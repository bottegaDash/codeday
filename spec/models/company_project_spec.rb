require 'rails_helper'

RSpec.describe CompanyProject, type: :model do
  describe "Creation" do
    before do
      @company = Company.create(name: "Compnay A")
      @company_project = CompanyProject.create(project: "ProjectA", company_id: @company.id)
    end
    it "can be created" do
      expect(@company).to be_valid
    end

    it "can not be created without a project and company ID " do
      @company_project.project = nil
      @company_project.id = nil
      expect(@company_project).to_not be_valid
    end
  end
end
