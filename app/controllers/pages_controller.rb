class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @items = policy_scope(Item).order('created_at DESC')
  end
end
