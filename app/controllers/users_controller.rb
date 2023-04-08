class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @date = @user.birth_date
    @userinfo = current_user.userinfo

    @items = @user.items
    @orders = Order.where(user_id: @user.id)

  end

end
