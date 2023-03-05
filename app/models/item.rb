class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_many_attached :images
  has_one :order

  with_options presence: true do
    validates :images
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { only_integer: true, message: 'is invalid.Input half-width characters.' }
  end
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is out of setting range' }
end
