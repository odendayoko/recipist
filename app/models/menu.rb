class Menu < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
  belongs_to :user
  has_one_attached :image

  def self.search(search)
    if search != ""
      Menu.where('name LIKE(?)', "%#{search}%")
    else
      Menu.all
    end
  end
end