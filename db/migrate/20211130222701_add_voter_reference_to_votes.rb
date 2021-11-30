class AddVoterReferenceToVotes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :votes, :users, column: :voter_id
    add_index :votes, :voter_id
    change_column_null :votes, :voter_id, false
  end
end
