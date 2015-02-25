class Answer < ActiveRecord::Base
  belongs_to :word
  validates :word, presence: true
  validates :content, presence: true

  scope :correct, -> {where(status: true)}
end