class Api::V1::QuestionAssessmentsController < Api::V1::GraphitiController
  def index
    question_assessments = QuestionAssessmentResource.all(params)
    respond_with(question_assessments)
  end

  def show
    question_assessment = QuestionAssessmentResource.find(params)
    respond_with(question_assessment)
  end

  def create
    question_assessment = QuestionAssessmentResource.build(params)

    if question_assessment.save
      render jsonapi: question_assessment, status: :created
    else
      render jsonapi_errors: question_assessment
    end
  end

  def update
    question_assessment = QuestionAssessmentResource.find(params)

    if question_assessment.update_attributes
      render jsonapi: question_assessment
    else
      render jsonapi_errors: question_assessment
    end
  end

  def destroy
    question_assessment = QuestionAssessmentResource.find(params)

    if question_assessment.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: question_assessment
    end
  end
end
