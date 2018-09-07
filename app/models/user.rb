class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :teamusers
  has_many :teams, through: :teamusers
  has_many :likes
  has_many :jokes
  mount_uploader :photo, PhotoUploader
end
