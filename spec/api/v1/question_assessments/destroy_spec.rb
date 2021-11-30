require 'rails_helper'

RSpec.describe "question_assessments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/question_assessments/#{question_assessment.id}"
  end

  describe 'basic destroy' do
    let!(:question_assessment) { create(:question_assessment) }

    it 'updates the resource' do
      expect(QuestionAssessmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { QuestionAssessment.count }.by(-1)
      expect { question_assessment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
