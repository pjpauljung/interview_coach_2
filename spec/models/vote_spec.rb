require "rails_helper"

RSpec.describe Vote, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:question) }

    it { should belong_to(:voter) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
