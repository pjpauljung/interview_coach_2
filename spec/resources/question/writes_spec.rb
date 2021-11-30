require 'rails_helper'

RSpec.describe QuestionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'questions',
          attributes: { }
        }
      }
    end

    let(:instance) do
      QuestionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Question.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:question) { create(:question) }

    let(:payload) do
      {
        data: {
          id: question.id.to_s,
          type: 'questions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      QuestionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { question.reload.updated_at }
      # .and change { question.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:question) { create(:question) }

    let(:instance) do
      QuestionResource.find(id: question.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Question.count }.by(-1)
    end
  end
end
