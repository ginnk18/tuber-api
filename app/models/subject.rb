class Subject < ApplicationRecord
  # has_many :tutor_subjects
  # has_many :tutors, through: :tutor_subjects

  has_and_belongs_to_many :tutors
end
