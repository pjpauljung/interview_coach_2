class QuestionAssessmentsController < ApplicationController
  before_action :current_user_must_be_question_assessment_interviewee, only: [:edit, :update, :destroy] 

  before_action :set_question_assessment, only: [:show, :edit, :update, :destroy]

  # GET /question_assessments
  def index
    @question_assessments = QuestionAssessment.page(params[:page]).per(10)
  end

  # GET /question_assessments/1
  def show
  end

  # GET /question_assessments/new
  def new
    @question_assessment = QuestionAssessment.new
  end

  # GET /question_assessments/1/edit
  def edit
  end

  # POST /question_assessments
  def create
    @question_assessment = QuestionAssessment.new(question_assessment_params)

    if @question_assessment.save
      message = 'QuestionAssessment was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @question_assessment, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /question_assessments/1
  def update
    if @question_assessment.update(question_assessment_params)
      redirect_to @question_assessment, notice: 'Question assessment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /question_assessments/1
  def destroy
    @question_assessment.destroy
    message = "QuestionAssessment was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to question_assessments_url, notice: message
    end
  end


  private

  def current_user_must_be_question_assessment_interviewee
    set_question_assessment
    unless current_user == @question_assessment.interviewee
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_question_assessment
      @question_assessment = QuestionAssessment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_assessment_params
      params.require(:question_assessment).permit(:question_id, :interviewee_id, :question_session_id)
    end
end
