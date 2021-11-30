class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :creator_id
      t.integer :company_id
      t.string :question

      t.timestamps
    end
  end
end
