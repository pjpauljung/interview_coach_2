class QuestionSessionsController < ApplicationController
  before_action :current_user_must_be_question_session_interviewee,
                only: %i[edit update destroy]

  before_action :set_question_session, only: %i[show edit update destroy]

  def index
    @q = QuestionSession.ransack(params[:q])
    @question_sessions = @q.result(distinct: true).includes(:interviewee,
                                                            :question_assessments, :company).page(params[:page]).per(10)
  end

  def show
    @question_assessment = QuestionAssessment.new
  end

  def new
    @question_session = QuestionSession.new
  end

  def edit; end

  def create
    @question_session = QuestionSession.new(question_session_params)

    if @question_session.save
      message = "QuestionSession was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @question_session, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @question_session.update(question_session_params)
      redirect_to @question_session,
                  notice: "Question session was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question_session.destroy
    message = "QuestionSession was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to question_sessions_url, notice: message
    end
  end

  private

  def current_user_must_be_question_session_interviewee
    set_question_session
    unless current_user == @question_session.interviewee
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_question_session
    @question_session = QuestionSession.find(params[:id])
  end

  def question_session_params
    params.require(:question_session).permit(:interviewee_id, :company_id)
  end
end
