class User::ItemsController < ApplicationController
  def index
    @items = policy_scope([:user, Item])
    # binding.pry
  end
end
