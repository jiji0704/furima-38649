class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_information
    validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_price, numericality: { only_integer: true, message: 'is invalid.Input half-width characters.' }
  end
    validates :item_price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  
end
