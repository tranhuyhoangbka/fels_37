class User < ActiveRecord::Base
  has_many :learneds
  has_many :results
  has_many :activities
  validates :name, presence: true, length: {maximum: 60}
  validates :email, presence: true, length: {maximum: 80}
  validates :password_digest, presence: true, length: {maximum: 80}
  has_secure_password
end