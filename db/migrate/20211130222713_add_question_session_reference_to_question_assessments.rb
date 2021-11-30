class AddQuestionSessionReferenceToQuestionAssessments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :question_assessments, :question_sessions
    add_index :question_assessments, :question_session_id
    change_column_null :question_assessments, :question_session_id, false
  end
end
