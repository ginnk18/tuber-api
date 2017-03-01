class Review < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  validates :student_id, presence: { message: "must login as student to review a tutor" }
  validates :student_id, uniqueness: { scope: :tutor_id, message: "has already reviewed tutor" }
  validates :tutor_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true,
            numericality: true,
            inclusion: { in: 1..5 }
end
