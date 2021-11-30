class QuestionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :creator_id, :integer
  attribute :company_id, :integer
  attribute :question, :string

  # Direct associations

  # Indirect associations

end