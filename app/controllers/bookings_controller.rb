class BookingsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "items/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end


  private

  def set_booking
    @booking = Booking.find(params[:item_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :finish_date, :item_id)
  end
end
