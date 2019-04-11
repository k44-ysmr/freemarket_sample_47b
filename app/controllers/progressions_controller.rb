class ProgressionsController < ApplicationController

  def index
    @nickname = current_user.nickname
    @items = Item.where(user_id: current_user.id, trade_status: 2).limit(3).order("created_at DESC")
  end

  private
  def use_before_action?
    true
  end


end
