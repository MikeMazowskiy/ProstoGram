class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :follower_follows, foreign_key: :followed_user_id, class_name: "Follower"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :followed_follows, foreign_key: :follower_id, class_name: "Follower"
  has_many :followed_user, through: :followed_follows, source: :followed_user

  has_one_attached :avatar

  def followers
    Follower.where(followed_user_id: self.id).count
  end

  def followed
    Follower.where(follower_id: self.id).count
  end

  def follow_check(user, current_user)
    @relation_boolean = Follower.where(follower_id: current_user, followed_user_id: user).exists?

    if @relation_boolean == true
      true
    else
      false
    end
  end

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable
end