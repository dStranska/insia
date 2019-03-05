class User < ApplicationRecord

  has_many :numbers
  has_secure_password

  #email
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  #password
  validates :password, confirmation: true, length: {minimum: 5}, presence: true
  validates_confirmation_of :password


end
