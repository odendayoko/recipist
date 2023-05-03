class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :menus
  has_many :favorites, dependent: :destroy
  has_many :favorite_menus, through: :favorites, source: :menu


end
