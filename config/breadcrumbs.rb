crumb :root do
  link "トップページ", root_path
end

crumb :uers_registration do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :uers_session do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :items do
  link "出品する", new_item_path
  parent :root
end

crumb :items_show do
  if params[:item_id] == nil
    item = Item.find(params[:id])
  else
    item = Item.find(params[:item_id])
  end
  link "商品詳細", item_path(item.id)
  parent :root
end

crumb :items_edit do
  item = Item.find(params[:id])
  link "商品情報の編集", edit_item_path(item.id)
  parent :items_show
end

crumb :orders do
  item = Item.find(params[:item_id])
  link "商品購入", item_orders_path(item.id)
 
  parent :items_show
end