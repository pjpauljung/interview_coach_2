class AddIntervieweeReferenceToQuestionSessions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :question_sessions, :users, column: :interviewee_id
    add_index :question_sessions, :interviewee_id
    change_column_null :question_sessions, :interviewee_id, false
  end
end
