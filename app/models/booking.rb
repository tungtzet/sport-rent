class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :start_date, :finish_date, presence: true
end
