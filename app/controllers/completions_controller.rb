class CompletionsController < ApplicationController

  before_action :move_to_index

  def index
    @nickname = current_user.nickname
    @items = Item.where(user_id: current_user.id, trade_status: 3).limit(3).order("created_at DESC")
  end

  private
  def move_to_index
    redirect_to controller: :users, action: :index unless user_signed_in?
  end
end
