class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false

  before_save :downcase_email

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  has_many :tutors
  has_many :students
end