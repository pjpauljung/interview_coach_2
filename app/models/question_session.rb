class QuestionSession < ApplicationRecord
  # Direct associations

  belongs_to :company

  has_many   :question_assessments,
             dependent: :destroy

  belongs_to :interviewee,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    interviewee.to_s
  end
end
