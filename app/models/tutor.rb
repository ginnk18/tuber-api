class Tutor < ApplicationRecord
  # has_many :tutor_subjects
  # has_many :subjects, through: :tutor_subjects
  has_many :reviews
  belongs_to :user
  has_and_belongs_to_many :subjects

end
