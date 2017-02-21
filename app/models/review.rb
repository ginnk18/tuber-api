class Review < ApplicationRecord
  belongs_to :student
  has_one :tutor
end
