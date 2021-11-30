require 'rails_helper'

RSpec.describe "question_assessments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/question_assessments/#{question_assessment.id}", payload
  end

  describe 'basic update' do
    let!(:question_assessment) { create(:question_assessment) }

    let(:payload) do
      {
        data: {
          id: question_assessment.id.to_s,
          type: 'question_assessments',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(QuestionAssessmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { question_assessment.reload.attributes }
    end
  end
end
