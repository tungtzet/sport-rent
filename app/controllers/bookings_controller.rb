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
      # render js: "alert(#{@booking.errors.full_messages.join(',')});"
      # render html: "<script>alert('No users!')</script>".html_safe
      render inline: "<p><%= @booking.errors.full_messages.join(',') %></p>"
      # render "items/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    @booking = set_booking
    @booking.destroy
    redirect_to user_bookings_path
    authorize @booking
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :finish_date, :item_id)
  end
end
