class UsersController < ApplicationController
  # before_action :set_user, only: :show

  def show
    @user = User.find(params[:id])
    @date = @user.birth_date
    @items = current_user.items
  end

  # def set_user
  #   # @buyitem = Item.find(item_id: params[:item_id])
  #   @userinfo = Userinfo.find(params[:user_id])
  # end
end
