class User::ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
  end
end
