class FavoritesController < ApplicationController
  # before_action :set_item

  def create
    # @favorite = Favorite.new(user_id: current_user.id, item_id: params[:item_id])
    @favorite = current_user.favorites.build(item_id: params[:item_id])
    @favorite.save
 
    redirect_to item_path(params[:item_id])
    # render 'create.js.erb'
  end

  def destroy
    @favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to item_path(params[:item_id])
    # render 'destroy.js.erb'
  end

  # def set_tweet
  #   @item = Item.find(params[:item_id])
  # end
end
