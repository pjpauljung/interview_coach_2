require "rails_helper"

RSpec.describe Question, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:company) }

    it { should have_many(:question_assessments) }

    it { should have_many(:votes) }

    it { should belong_to(:creator) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
