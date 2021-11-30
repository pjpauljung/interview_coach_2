class QuestionAssessmentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :question_id, :integer
  attribute :interviewee_id, :integer
  attribute :question_session_id, :integer

  # Direct associations

  belongs_to :question

  belongs_to :interviewee,
             resource: UserResource

  # Indirect associations

end
