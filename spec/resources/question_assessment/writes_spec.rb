require 'rails_helper'

RSpec.describe QuestionAssessmentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'question_assessments',
          attributes: { }
        }
      }
    end

    let(:instance) do
      QuestionAssessmentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { QuestionAssessment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:question_assessment) { create(:question_assessment) }

    let(:payload) do
      {
        data: {
          id: question_assessment.id.to_s,
          type: 'question_assessments',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      QuestionAssessmentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { question_assessment.reload.updated_at }
      # .and change { question_assessment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:question_assessment) { create(:question_assessment) }

    let(:instance) do
      QuestionAssessmentResource.find(id: question_assessment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { QuestionAssessment.count }.by(-1)
    end
  end
end
