class Item < ApplicationRecord
  SPORT_TYPES = ["Sky Diving", "Sky Surfing", "Watersports", "Golf", "Biking", "Motor Racing", "Tennis", "Hockey", "Bungee Jumping", "Ice Skating", "Skiing" ]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, :category, :description, :location, :price_per_day, presence: true
  validates :price_per_day, numericality: { only_integer: true }
  validates :category, inclusion: { in: SPORT_TYPES }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
