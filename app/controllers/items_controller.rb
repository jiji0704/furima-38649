class ItemsController < ApplicationController
  def index
  end


  #画像の保存を許可するストロングパラメーターにしましょう
  # private

  # def item_params
  #   params.require(:item).permit(:image).merge(user_id: current_user.id)
  # end
end
