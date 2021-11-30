require 'rails_helper'

RSpec.describe "question_assessments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/question_assessments", params: params
  end

  describe 'basic fetch' do
    let!(:question_assessment1) { create(:question_assessment) }
    let!(:question_assessment2) { create(:question_assessment) }

    it 'works' do
      expect(QuestionAssessmentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['question_assessments'])
      expect(d.map(&:id)).to match_array([question_assessment1.id, question_assessment2.id])
    end
  end
end
