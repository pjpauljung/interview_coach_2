class AddQuestionReferenceToQuestionAssessments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :question_assessments, :questions
    add_index :question_assessments, :question_id
    change_column_null :question_assessments, :question_id, false
  end
end
