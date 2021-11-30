require 'rails_helper'

RSpec.describe QuestionSession, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:company) }

    it { should have_many(:question_assessments) }

    it { should belong_to(:interviewee) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
