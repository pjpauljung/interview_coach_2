class Question < ApplicationRecord
  # Direct associations

  has_many   :votes,
             :dependent => :destroy

  belongs_to :creator,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    creator.to_s
  end

end
