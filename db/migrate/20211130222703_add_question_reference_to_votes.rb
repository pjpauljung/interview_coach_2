class AddQuestionReferenceToVotes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :votes, :questions
    add_index :votes, :question_id
    change_column_null :votes, :question_id, false
  end
end
