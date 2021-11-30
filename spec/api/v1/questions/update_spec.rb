require "rails_helper"

RSpec.describe "questions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/questions/#{question.id}", payload
  end

  describe "basic update" do
    let!(:question) { create(:question) }

    let(:payload) do
      {
        data: {
          id: question.id.to_s,
          type: "questions",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(QuestionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { question.reload.attributes }
    end
  end
end
