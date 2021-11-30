class AddCreatorReferenceToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :questions, :users, column: :creator_id
    add_index :questions, :creator_id
    change_column_null :questions, :creator_id, false
  end
end
