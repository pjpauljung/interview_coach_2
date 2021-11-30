class Api::V1::QuestionSessionsController < Api::V1::GraphitiController
  def index
    question_sessions = QuestionSessionResource.all(params)
    respond_with(question_sessions)
  end

  def show
    question_session = QuestionSessionResource.find(params)
    respond_with(question_session)
  end

  def create
    question_session = QuestionSessionResource.build(params)

    if question_session.save
      render jsonapi: question_session, status: :created
    else
      render jsonapi_errors: question_session
    end
  end

  def update
    question_session = QuestionSessionResource.find(params)

    if question_session.update_attributes
      render jsonapi: question_session
    else
      render jsonapi_errors: question_session
    end
  end

  def destroy
    question_session = QuestionSessionResource.find(params)

    if question_session.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: question_session
    end
  end
end
