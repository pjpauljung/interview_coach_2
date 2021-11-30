require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:question_sessions) }

    it { should have_many(:question_assessments) }

    it { should have_many(:created_questions) }

    it { should have_many(:votes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
