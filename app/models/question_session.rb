class QuestionSession < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    interviewee.to_s
  end

end
