class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:user).limit(4).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private
    def item_params
      params.require(:item).permit(:name, :description,:price,:condition,:shipping_fee,:shipping_from,:days_before_shipping,:shipping_method,:trade_status,:prefecture_id,:brand_id,:category_id,:size_id,images_attributes: [:id,:name]).merge(user_id: current_user.id)
    end
end
