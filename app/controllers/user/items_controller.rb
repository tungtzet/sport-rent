class User::ItemsController < ApplicationController
  def index
    @items = policy_scope([:user, Item])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_items_path
    authorize @item
  end
end
