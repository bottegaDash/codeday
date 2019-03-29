require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "Creation" do
    before do
      @company = Company.create(name: "Compnay A")
    end
    it "can be created" do
      expect(@company).to be_valid
    end

    it "can not be created without a name" do
      @company.name = nil
      expect(@company).to_not be_valid
    end
  end
end
