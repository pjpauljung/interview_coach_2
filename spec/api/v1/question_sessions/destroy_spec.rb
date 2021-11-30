require 'rails_helper'

RSpec.describe "question_sessions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/question_sessions/#{question_session.id}"
  end

  describe 'basic destroy' do
    let!(:question_session) { create(:question_session) }

    it 'updates the resource' do
      expect(QuestionSessionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { QuestionSession.count }.by(-1)
      expect { question_session.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
