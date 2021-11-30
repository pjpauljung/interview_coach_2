class AddIntervieweeReferenceToQuestionAssessments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :question_assessments, :users, column: :interviewee_id
    add_index :question_assessments, :interviewee_id
    change_column_null :question_assessments, :interviewee_id, false
  end
end
