class Item < ApplicationRecord
  belongs_to :user
  belongs_to :catedory
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :schedued_delivery
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_information, presence: true
  validates :item_category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_shipping_fee_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, presence: true,numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  validates :image, presence: true
end
