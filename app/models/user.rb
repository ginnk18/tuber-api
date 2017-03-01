class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :email, presence: true

  has_many :tutors
  has_many :students
end