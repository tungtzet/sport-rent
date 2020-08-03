class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, :category, :description, :location, :price_per_day, presence: true
  validates :price_per_day, numericality: { only_integer: true }
end
