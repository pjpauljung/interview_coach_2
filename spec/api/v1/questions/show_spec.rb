require "rails_helper"

RSpec.describe "questions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/questions/#{question.id}", params: params
  end

  describe "basic fetch" do
    let!(:question) { create(:question) }

    it "works" do
      expect(QuestionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("questions")
      expect(d.id).to eq(question.id)
    end
  end
end
