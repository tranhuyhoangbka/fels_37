class Category < ActiveRecord::Base
  has_many :words
  has_many :learneds
  validates :name, presence: true, length: {maximum: 120}  
end