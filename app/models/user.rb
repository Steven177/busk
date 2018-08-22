class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artist_genres
  has_many :performances, dependent: :destroy
  has_many :attendances

  validates :email, presence: true, uniqueness: true
  mount_uploader :avatar, PhotoUploader

end
