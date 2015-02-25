class Learned < ActiveRecord::Base
  belongs_to :user
  belongs_to :word
  belongs_to :category
  validates :user, presence: true
  validates :word, presence: true
end
