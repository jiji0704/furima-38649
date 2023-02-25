class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :ensure_user, only: [:edit, :update, :destroy]
  before_action :sold_out,only: [:edit, :update, :destroy]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id,
                                 :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def ensure_user
    return if @item.user_id == current_user.id

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out  
    unless @item.order == nil #購入履歴があれば
     redirect_to root_path
    end
  end

end
