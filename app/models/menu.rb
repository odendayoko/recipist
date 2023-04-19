class Menu < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end