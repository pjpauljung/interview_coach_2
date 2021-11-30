class Vote < ApplicationRecord
  enum vote_type: {"upvote"=>0, "downvote"=>1} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    voter.to_s
  end

end
