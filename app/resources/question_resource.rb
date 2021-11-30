class QuestionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :creator_id, :integer
  attribute :company_id, :integer
  attribute :question, :string

  # Direct associations

  belongs_to :company

  has_many   :question_assessments

  has_many   :votes

  belongs_to :creator,
             resource: UserResource

  # Indirect associations
end
