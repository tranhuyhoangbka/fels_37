class Learned < ActiveRecord::Base
  belongs_to :user
  belongs_to :word
  belongs_to :category
  validates :user, presence: true
  validates :word, presence: true
  scope :filter_by_category, ->(category) {where(category: category)}
end