class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect to root_path
    else
      render new
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :item_information, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id, :item_price, :image ).merge(user_id: current_user.id)
  end

  end

end
