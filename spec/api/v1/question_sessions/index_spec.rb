require "rails_helper"

RSpec.describe "question_sessions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/question_sessions", params: params
  end

  describe "basic fetch" do
    let!(:question_session1) { create(:question_session) }
    let!(:question_session2) { create(:question_session) }

    it "works" do
      expect(QuestionSessionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["question_sessions"])
      expect(d.map(&:id)).to match_array([question_session1.id,
                                          question_session2.id])
    end
  end
end
