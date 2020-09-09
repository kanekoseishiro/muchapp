class User < ApplicationRecord
  has_one_attached :image
  has_many :members
  has_many :messages
  has_many :following_relationships,foreign_key: "follower_id", class_name: "FollowRelationship",  dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships,foreign_key: "following_id",class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  
  with_options presence: true do
    validates :image
    validates :nickname, length: { maximum: 20 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }, on: :create
    validates :age, format: { with:/[0-9]\d/ }, on: :create
    validates :gender, numericality: { other_than: 1 }, on: :create
    validates :birthday, on: :create
    validates :prefecture, numericality: { other_than: 1 }
    validates :phone_number, length: { maximum: 11 }, on: :create
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    self.following_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end
  
  def matchers
    User.where(id: follower_relationships.select(:follower_id))
     .where(id: following_relationships.select(:following_id))
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
