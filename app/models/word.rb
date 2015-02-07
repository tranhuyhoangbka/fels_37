class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers
  has_many :learneds
  validates :category, presence: true
  validates :content, presence: true, length: {maximum: 32}
end
