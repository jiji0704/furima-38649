class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :buildings, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid.Input only number' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :phone_number, length: { minimum: 10, message: 'is too short' }
  def save
    # 商品情報・ユーザー情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                    buildings: buildings, phone_number: phone_number, order_id: order.id)
  end
end
