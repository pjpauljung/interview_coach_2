class User < ApplicationRecord
  # Direct associations

  has_many   :question_sessions,
             :foreign_key => "interviewee_id",
             :dependent => :destroy

  has_many   :question_assessments,
             :foreign_key => "interviewee_id",
             :dependent => :destroy

  has_many   :created_questions,
             :class_name => "Question",
             :foreign_key => "creator_id",
             :dependent => :destroy

  has_many   :votes,
             :foreign_key => "voter_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
