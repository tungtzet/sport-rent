class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :start_date, :finish_date, presence: true
  validate :valid_date

  def valid_date
    if start_date > finish_date || start_date < Date.today
      errors.add(:start_date, "can't be in the past or later than finish date")
    end
  end   
end
