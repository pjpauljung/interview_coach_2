class QuestionsController < ApplicationController
  before_action :current_user_must_be_question_creator,
                only: %i[edit update destroy]

  before_action :set_question, only: %i[show edit update destroy]

  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).includes(:creator, :votes,
                                                    :question_assessments, :company).page(params[:page]).per(10)
  end

  def show
    @question_assessment = QuestionAssessment.new
    @vote = Vote.new
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new(question_params)

    if @question.save
      message = "Question was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @question, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "Question was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    message = "Question was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to questions_url, notice: message
    end
  end

  private

  def current_user_must_be_question_creator
    set_question
    unless current_user == @question.creator
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:creator_id, :company_id, :question)
  end
end
