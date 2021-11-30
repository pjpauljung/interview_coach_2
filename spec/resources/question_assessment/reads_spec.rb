require 'rails_helper'

RSpec.describe QuestionAssessmentResource, type: :resource do
  describe 'serialization' do
    let!(:question_assessment) { create(:question_assessment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(question_assessment.id)
      expect(data.jsonapi_type).to eq('question_assessments')
    end
  end

  describe 'filtering' do
    let!(:question_assessment1) { create(:question_assessment) }
    let!(:question_assessment2) { create(:question_assessment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: question_assessment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([question_assessment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:question_assessment1) { create(:question_assessment) }
      let!(:question_assessment2) { create(:question_assessment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            question_assessment1.id,
            question_assessment2.id
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
            question_assessment2.id,
            question_assessment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
