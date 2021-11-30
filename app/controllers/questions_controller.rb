class QuestionsController < ApplicationController
  before_action :current_user_must_be_question_creator, only: [:edit, :update, :destroy] 

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(:distinct => true).includes(:creator, :votes, :question_assessments, :company).page(params[:page]).per(10)
  end

  # GET /questions/1
  def show
    @question_assessment = QuestionAssessment.new
    @vote = Vote.new
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      message = 'Question was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @question, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    message = "Question was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to questions_url, notice: message
    end
  end


  private

  def current_user_must_be_question_creator
    set_question
    unless current_user == @question.creator
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:creator_id, :company_id, :question)
    end
end
