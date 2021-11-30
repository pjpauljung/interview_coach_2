class QuestionSessionsController < ApplicationController
  before_action :set_question_session, only: [:show, :edit, :update, :destroy]

  # GET /question_sessions
  def index
    @question_sessions = QuestionSession.all
  end

  # GET /question_sessions/1
  def show
  end

  # GET /question_sessions/new
  def new
    @question_session = QuestionSession.new
  end

  # GET /question_sessions/1/edit
  def edit
  end

  # POST /question_sessions
  def create
    @question_session = QuestionSession.new(question_session_params)

    if @question_session.save
      redirect_to @question_session, notice: 'Question session was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /question_sessions/1
  def update
    if @question_session.update(question_session_params)
      redirect_to @question_session, notice: 'Question session was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /question_sessions/1
  def destroy
    @question_session.destroy
    redirect_to question_sessions_url, notice: 'Question session was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_session
      @question_session = QuestionSession.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_session_params
      params.require(:question_session).permit(:interviewee_id, :company_id)
    end
end
