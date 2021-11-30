class Company < ApplicationRecord
  # Direct associations

  has_many   :questions,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    company_name
  end

end
