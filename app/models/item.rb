class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user 
  belongs_to :catedory, optional: true
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :schedued_delivery, optional: true
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_information, presence: true
  validates :item_category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_shipping_fee_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, presence: true,numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, allow_blank: true, message: 'is invalid.Input half-width characters.'}
  validates :item_price, presence: true,numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, message: 'is out of setting range'}

end
