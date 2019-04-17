class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :destroy, :update]
  before_action :set_prefecture, only: [:show]

  def index
    @ladies_items = Item.where(category_id: 1).order("created_at DESC")
    @mens_items = Item.where(category_id: 2).order("created_at DESC")
    @kids_items = Item.where(category_id: 3).order("created_at DESC")
    @cosme_items = Item.where(category_id: 7).order("created_at DESC")
    @chanel_items = Item.where(brand_id: 1).order("created_at DESC")
    @louisvuitton_items = Item.where(brand_id: 3).order("created_at DESC")
    @supreme_items = Item.where(brand_id: 4).order("created_at DESC")
    @nike_items = Item.where(brand_id: 2).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build
    @category = Category.new
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
    if @item.update(trade_status: start_or_stop_displaying_params[:trade_status])
      redirect_to item_path(@item)
    else
      render :edit
    end

  end

  def destroy
    @item.destroy if @item.user_id === current_user.id
    redirect_to root_path
  end

  def search
  end

  private

    def item_params
      params.require(:item).permit(:name, :description,:price,:condition,:shipping_fee,:days_before_shipping,:shipping_method,:trade_status,:prefecture_id,:brand_id,:category_id,:size_id,images_attributes: [:id,:name]).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def set_prefecture
      @prefecture = Prefecture.find(@item.prefecture_id)
    end

    def start_or_stop_displaying_params
      params.permit(:trade_status)
    end

end
