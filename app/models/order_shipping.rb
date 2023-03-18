class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :buildings, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は不正な値です。 次のように入力してください (例 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :city
    validates :addresses
    validates :phone_number, numericality: { only_integer: true, message: 'は不正な値です。数字で入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :phone_number, length: { in: 10..11, message: 'は不正な値です' }
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                    buildings: buildings, phone_number: phone_number, order_id: order.id)
  end
end
