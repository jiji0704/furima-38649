class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]
  before_action :ensure_user
  before_action :sold_out

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
   params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses ,:buildings, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]               # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item = Item.find(params[:item_id]).price,  # 商品の値段
      card: order_params[:token],                         # カードトークン
      currency: 'jpy'                                     # 通貨の種類（日本円）
    )
  end

  def ensure_user
    if @item.user_id == current_user.id
    redirect_to root_path
    end
  end

  def sold_out  
    unless @item.order == nil
     redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end