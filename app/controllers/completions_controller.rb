class CompletionsController < ApplicationController

  before_action :require_signin

  def index
    @nickname = current_user.nickname
    @items = Item.where(user_id: current_user.id, trade_status: 3).limit(3).order("created_at DESC")
  end

end
