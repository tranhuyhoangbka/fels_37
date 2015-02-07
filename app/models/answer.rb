class Answer < ActiveRecord::Base
  belongs_to :word
  validates :word, presence: true
  validates :content, presence: true
end
