require 'rails_helper'

RSpec.describe "question_assessments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/question_assessments", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'question_assessments',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(QuestionAssessmentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { QuestionAssessment.count }.by(1)
    end
  end
end
