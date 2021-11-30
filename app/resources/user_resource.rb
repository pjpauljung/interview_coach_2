class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :first_name, :string
  attribute :last_name, :string

  # Direct associations

  has_many   :question_sessions,
             foreign_key: :interviewee_id

  has_many   :question_assessments,
             foreign_key: :interviewee_id

  has_many   :created_questions,
             resource: QuestionResource,
             foreign_key: :creator_id

  has_many   :votes,
             foreign_key: :voter_id

  # Indirect associations

end
