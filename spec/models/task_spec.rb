require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "Creation" do
    before do
      @company = Company.create(name: "Compnay A")
      @company_project = CompanyProject.create(project: "ProjectA", company_id: @company.id)
      @task = Task.create(description: "asdfasdf", company_project_id: @company_project.id)
    end
    it "can be created" do
      expect(@task).to be_valid
    end

  end
end
