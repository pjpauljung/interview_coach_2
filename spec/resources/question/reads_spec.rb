require 'rails_helper'

RSpec.describe QuestionResource, type: :resource do
  describe 'serialization' do
    let!(:question) { create(:question) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(question.id)
      expect(data.jsonapi_type).to eq('questions')
    end
  end

  describe 'filtering' do
    let!(:question1) { create(:question) }
    let!(:question2) { create(:question) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: question2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([question2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:question1) { create(:question) }
      let!(:question2) { create(:question) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            question1.id,
            question2.id
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
            question2.id,
            question1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
