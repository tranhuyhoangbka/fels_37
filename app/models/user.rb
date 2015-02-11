class User < ActiveRecord::Base
  before_save {self.email = email.downcase}	
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :learneds
  has_many :results
  has_many :activities
  validates :name, presence: true, length: {maximum: 60}
  validates :email, presence: true, length: {maximum: 80}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {maximum: 80, minimum: 6}
  validates :password_confirmation, presence: true, length: {maximum: 80, minimum: 6}
  has_secure_password
end
