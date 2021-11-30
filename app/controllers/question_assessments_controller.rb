class QuestionAssessmentsController < ApplicationController
  before_action :current_user_must_be_question_assessment_interviewee,
                only: %i[edit update destroy]

  before_action :set_question_assessment,
                only: %i[show edit update destroy]

  def index
    @q = QuestionAssessment.ransack(params[:q])
    @question_assessments = @q.result(distinct: true).includes(:interviewee,
                                                               :question, :question_session).page(params[:page]).per(10)
  end

  def show; end

  def new
    @question_assessment = QuestionAssessment.new
  end

  def edit; end

  def create
    @question_assessment = QuestionAssessment.new(question_assessment_params)

    if @question_assessment.save
      message = "QuestionAssessment was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @question_assessment, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @question_assessment.update(question_assessment_params)
      redirect_to @question_assessment,
                  notice: "Question assessment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question_assessment.destroy
    message = "QuestionAssessment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to question_assessments_url, notice: message
    end
  end

  private

  def current_user_must_be_question_assessment_interviewee
    set_question_assessment
    unless current_user == @question_assessment.interviewee
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_question_assessment
    @question_assessment = QuestionAssessment.find(params[:id])
  end

  def question_assessment_params
    params.require(:question_assessment).permit(:question_id,
                                                :interviewee_id, :question_session_id)
  end
end
