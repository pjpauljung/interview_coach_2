class QuestionSessionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :interviewee_id, :integer
  attribute :company_id, :integer

  # Direct associations

  belongs_to :interviewee,
             resource: UserResource

  # Indirect associations

end
