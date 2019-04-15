class SearchController < ApplicationController
  def index
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(16)
    @itemsall = Item.all.order("created_at DESC").limit(16)
  end
end
