class ListingsController < ApplicationController
  def index
    @name = current_user.nickname
    @items = Item.where(user_id: current_user.id)
  end
end
