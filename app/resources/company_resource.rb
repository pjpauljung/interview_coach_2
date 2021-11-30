class CompanyResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :company_name, :string

  # Direct associations

  has_many   :question_sessions

  has_many   :questions

  # Indirect associations
end
