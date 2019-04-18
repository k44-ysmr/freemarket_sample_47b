class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
    @item = Item.find(params[:id])
  end

  def update
  end

  def itemupdate
    @item = Item.find(params[:id])
    # 下記の条件分岐によってrenderされた時はelseを通るようにする
    if @item.images.present?
      @image = Image.find_by(item_id: @item.id)
      @image.destroy
      @item.update(item_params)
    else
      @item.update(item_params)
    end
    # 画像が編集されなかった時はもう一度編集画面に遷移させる
    @image = Image.find_by(item_id: @item.id)
    if @image.present?
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
  end

  def search
  end

  private

    def item_params
      params.require(:item).permit(:name, :description,:price,:condition,:shipping_fee,:days_before_shipping,:shipping_method,:trade_status,:prefecture_id,:brand_id,:category_id,:size_id,images_attributes: [:id,:name]).merge(user_id: current_user.id)
    end
end
