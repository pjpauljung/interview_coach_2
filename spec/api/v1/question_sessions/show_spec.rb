require "rails_helper"

RSpec.describe "question_sessions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/question_sessions/#{question_session.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:question_session) { create(:question_session) }

    it "works" do
      expect(QuestionSessionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("question_sessions")
      expect(d.id).to eq(question_session.id)
    end
  end
end
