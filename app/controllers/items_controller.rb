class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @item = Item.find(params[:id])
    authorize @item
  end
end
