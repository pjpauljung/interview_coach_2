class CreateQuestionSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :question_sessions do |t|
      t.integer :interviewee_id
      t.integer :company_id

      t.timestamps
    end
  end
end
