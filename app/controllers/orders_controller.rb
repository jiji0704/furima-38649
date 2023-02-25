class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
   params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses ,:buildings, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end