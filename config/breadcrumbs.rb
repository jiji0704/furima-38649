crumb :root do
  link "トップページ", root_path
end

crumb :uers_registration do
  link "新規登録1", new_user_registration_path
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

crumb :items_show do |item|  # このブロック変数「item」の中身を定義する必要がある
  link "商品詳細", item_path(item.id)
  parent :root
end

crumb :items_edit do |item|
  #item = Item.find(params[:id])
  link "商品情報の編集", edit_item_path(item.id)
  parent :items_show, item
end

crumb :orders do |item|
  # item = Item.find(params[:item_id])
  link "商品購入", item_orders_path(item.id) 
  parent :items_show, item
end

crumb :users do
  link "ユーザーページ", user_path
  parent :root
end

crumb :items do
  link "検索する", search_items_path
  parent :root
end

crumb :userinfos do
  link "新規登録2", userinfos_path
  parent :uers_registration
end