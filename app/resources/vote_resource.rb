class VoteResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :voter_id, :integer
  attribute :question_id, :integer
  attribute :vote_type, :string_enum, allow: Vote.vote_types.keys

  # Direct associations

  # Indirect associations

end
