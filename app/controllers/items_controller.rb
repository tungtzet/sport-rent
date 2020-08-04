class ItemsController < ApplicationController
<<<<<<< HEAD
  def index
    @items = Item.all
  end

  def show
    @items = set_item
  end

  private

  def set_item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :location, :price_per_day)
  end
=======
>>>>>>> e8fdd89eb1748f83787ed41cb2739b2a5b1c5de6
end
