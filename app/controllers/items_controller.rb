class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  before_action :set_item, only: [:show, :edit, :destroy, :update, :infoupdate]

  before_action :set_prefecture, only: [:show]

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
    if @item.update(trade_status: start_or_stop_displaying_params[:trade_status])
      redirect_to item_path(@item)
    else
      render :edit
    end

  end

  def infoupdate
    set_image
    if @item.update(item_params)
      # 画像が編集されなかった時はもう一度編集画面に遷移させる
      @image = Image.find_by(item_id: @item.id)
      if @item.images.first.present?
        redirect_to root_path
      else
        render action: :edit
      end
    else
      render action: :edit
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

    def set_image
    # 条件分岐によってrenderされた時はelseを通るようにする
      if @item.images.first.present?
        @image = Image.find_by(item_id: @item.id)
        if @image.destroy
        else
          render action: :edit
        end
      else
      end
    end

end
