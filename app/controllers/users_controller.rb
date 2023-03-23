class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @date = @user.birth_date
    @items = current_user.items
  end

  # def search
  #   return nil if params[:keyword] == ""
  #   job = Job.where(['job LIKE ?', "%#{params[:keyword]}%"] )
  #   render json:{ keyword: job }
  # end
end
