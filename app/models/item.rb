class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name , presence: true
  validates :item_information , presence: true
  validates :item_category_id , presence: true
  validates :item_sales_status_id , presence: true
  validates :item_shipping_fee_status_id , presence: true
  validates :prefecture_id , presence: true
  validates :item_scheduled_delivery_id , presence: true
  validates :item_price , presence: true
  validates :image, presence: true

end
