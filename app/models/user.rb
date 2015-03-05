class User < ActiveRecord::Base
  has_many :learneds
  has_many :results
  has_many :activities
  validates :name, presence: true, length: {maximum: 60}
  validates :email, presence: true, length: {maximum: 80}
  validates :password, presence: true, length: {minimum: 6}, allow_blank: true
  has_secure_password
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id',
    dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id',
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    active_relationships.create followed_id: other_user.id
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include? other_user
  end

  def feed
    Activity.where user_id: following_ids << id
  end
end