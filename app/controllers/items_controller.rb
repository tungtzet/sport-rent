class ItemsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :destroy]
  def show
    set_item
    authorize @item
    @booking = Booking.new
  end

  def index
    @items = Item.geocoded # returns flats with coordinates

    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end
    @items = policy_scope(Item).order(created_at: :desc)
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item
      @item.save
      redirect_to item_path(@item)
    else
      render new
    end
    authorize @item
  end

  def edit
    set_item
    authorize @item
  end

  def update
    set_item
    if current_user
      @item.update(item_params)
      redirect_to items_path(@item)
    else
      render new
    end
    authorize @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
    authorize @item
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :location, :price_per_day, photos: [])
  end

end
