require 'rails_helper'

RSpec.describe QuestionAssessment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:question_session) }

    it { should belong_to(:question) }

    it { should belong_to(:interviewee) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
