class AddCompanyReferenceToQuestionSessions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :question_sessions, :companies
    add_index :question_sessions, :company_id
    change_column_null :question_sessions, :company_id, false
  end
end
