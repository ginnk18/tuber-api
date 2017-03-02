class Tutor < ApplicationRecord
  # has_many :tutor_subjects
  # has_many :subjects, through: :tutor_subjects
  has_many :reviews

  has_and_belongs_to_many :subjects

  #belongs_to :user
end
