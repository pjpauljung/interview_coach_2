require 'rails_helper'

RSpec.describe QuestionSessionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'question_sessions',
          attributes: { }
        }
      }
    end

    let(:instance) do
      QuestionSessionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { QuestionSession.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:question_session) { create(:question_session) }

    let(:payload) do
      {
        data: {
          id: question_session.id.to_s,
          type: 'question_sessions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      QuestionSessionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { question_session.reload.updated_at }
      # .and change { question_session.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:question_session) { create(:question_session) }

    let(:instance) do
      QuestionSessionResource.find(id: question_session.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { QuestionSession.count }.by(-1)
    end
  end
end
