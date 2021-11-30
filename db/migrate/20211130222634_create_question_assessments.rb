class CreateQuestionAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :question_assessments do |t|
      t.integer :question_id
      t.integer :interviewee_id
      t.integer :question_session_id

      t.timestamps
    end
  end
end
