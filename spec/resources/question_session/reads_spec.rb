require 'rails_helper'

RSpec.describe QuestionSessionResource, type: :resource do
  describe 'serialization' do
    let!(:question_session) { create(:question_session) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(question_session.id)
      expect(data.jsonapi_type).to eq('question_sessions')
    end
  end

  describe 'filtering' do
    let!(:question_session1) { create(:question_session) }
    let!(:question_session2) { create(:question_session) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: question_session2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([question_session2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:question_session1) { create(:question_session) }
      let!(:question_session2) { create(:question_session) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            question_session1.id,
            question_session2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            question_session2.id,
            question_session1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
