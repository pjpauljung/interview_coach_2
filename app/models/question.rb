class Question < ApplicationRecord
  # Direct associations

  belongs_to :creator,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    creator.to_s
  end

end
