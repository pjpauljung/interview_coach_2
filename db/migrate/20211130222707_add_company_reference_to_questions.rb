class AddCompanyReferenceToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :questions, :companies
    add_index :questions, :company_id
    change_column_null :questions, :company_id, false
  end
end
