class ItemsController < ApplicationController

before_action :set_item, only: [:show, :destroy, :update]

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
    @images = @item.images
  end

  def edit
  end

  def update
    @item.update(trade_status: start_or_stop_displaying_params[:trade_status])
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy if @item.user_id === current_user.id
    redirect_to root_path
  end

  def search
  end

  private
    def item_params
      params.require(:item).permit(:name, :description,:price,:condition,:shipping_fee,:shipping_from,:days_before_shipping,:shipping_method,:trade_status,:prefecture_id,:brand_id,:category_id,:size_id,images_attributes: [:id,:name]).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
      @prefecture = Prefecture.find(@item.prefecture_id)
    end

    def start_or_stop_displaying_params
      params.permit(:trade_status)
    end

end
