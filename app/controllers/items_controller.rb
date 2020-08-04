class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = policy_scope(Item).order(created_at: :desc)
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
end
