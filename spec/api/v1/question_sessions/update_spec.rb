require "rails_helper"

RSpec.describe "question_sessions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/question_sessions/#{question_session.id}", payload
  end

  describe "basic update" do
    let!(:question_session) { create(:question_session) }

    let(:payload) do
      {
        data: {
          id: question_session.id.to_s,
          type: "question_sessions",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(QuestionSessionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { question_session.reload.attributes }
    end
  end
end
