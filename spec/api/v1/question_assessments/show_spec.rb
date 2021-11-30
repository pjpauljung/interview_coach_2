require "rails_helper"

RSpec.describe "question_assessments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/question_assessments/#{question_assessment.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:question_assessment) { create(:question_assessment) }

    it "works" do
      expect(QuestionAssessmentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("question_assessments")
      expect(d.id).to eq(question_assessment.id)
    end
  end
end
