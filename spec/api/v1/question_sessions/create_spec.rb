require 'rails_helper'

RSpec.describe "question_sessions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/question_sessions", payload
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
          type: 'question_sessions',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(QuestionSessionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { QuestionSession.count }.by(1)
    end
  end
end
