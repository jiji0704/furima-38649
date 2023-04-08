class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @date = @user.birth_date
    @userinfo = current_user.userinfo

    @items = current_user.items
    @orders = Order.where(user_id: current_user.id)
    # item =  Item.find(item_id: params[:item_id])
    # binding.pry
  end

end
