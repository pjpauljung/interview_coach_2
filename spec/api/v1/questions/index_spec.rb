require 'rails_helper'

RSpec.describe "questions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/questions", params: params
  end

  describe 'basic fetch' do
    let!(:question1) { create(:question) }
    let!(:question2) { create(:question) }

    it 'works' do
      expect(QuestionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['questions'])
      expect(d.map(&:id)).to match_array([question1.id, question2.id])
    end
  end
end
