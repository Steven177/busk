class Performance < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :attendances
  # Validations
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :photo, presence: true
  # Geocode
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # Cloudinary
  mount_uploader :photo, PhotoUploader
end
