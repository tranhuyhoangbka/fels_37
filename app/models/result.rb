class Result < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :list_word_id, presence: true
  validates :list_result, presence: true
end
