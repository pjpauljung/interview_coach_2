class QuestionAssessment < ApplicationRecord
  # Direct associations

  belongs_to :question

  belongs_to :interviewee,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    question.to_s
  end

end
