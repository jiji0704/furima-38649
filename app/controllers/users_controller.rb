class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @date = @user.birth_date
    @items = current_user.items
  end
end
