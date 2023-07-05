class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :menus
  has_many :favorites, dependent: :destroy
  has_many :favorite_menus, through: :favorites, source: :menu
  has_many :follower, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :followed, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :following_users, through: :follower, source: :followed 
  has_many :follower_users, through: :followed, source: :follower 
  
  validates :nickname, presence: true, length: { maximum: 6 }

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_users.include?(user)
  end
end
