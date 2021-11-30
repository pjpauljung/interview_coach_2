class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :question_id
      t.integer :vote_type

      t.timestamps
    end
  end
end
