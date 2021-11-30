class Company < ApplicationRecord
  # Direct associations

  has_many   :question_sessions,
             dependent: :destroy

  has_many   :questions,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    company_name
  end
end
