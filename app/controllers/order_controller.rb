class OrderController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  # def new
  #   @order_shipping = OrderShipping.new
  # end

  def create
  #   @order_shipping = OrderShipping.new(order_params)
  #   if @order_shipping.valid?
  #     @order_shipping.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  end

  # def order_params
  #   params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses ,:buildings, :phone_number).merge(user_id: current_user.id)
  # end

end
