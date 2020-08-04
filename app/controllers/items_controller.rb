class ItemsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    set_item
    authorize @item

  def index
    @items = Item.all
    @items = policy_scope(Item).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def created
    @item = Item.new(item_params)
    if @item
      @item.save
      redirect_to item_path(@item)
    else
      render new
    end
  end

  private

  def set_item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :description, :location, :price_per_day)
  end
end
