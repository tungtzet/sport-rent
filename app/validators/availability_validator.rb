  
class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    bookings = Booking.where(["item_id =?", record.item_id])
    date_ranges = bookings.map { |booking| booking.start_date..booking.finish_date }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "not available")
      end
    end
  end
end