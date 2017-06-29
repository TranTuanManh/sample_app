class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, format: {with: VALID_EMAIL_REGEX},
    presence: true,
    uniqueness: {case_sensitive: false},
    length: {maximum: 255}
  validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true, length: {maximum: 50}
  has_secure_password

  before_save :email_downcase

  private
  def email_downcase
    email.downcase!
  end
end
