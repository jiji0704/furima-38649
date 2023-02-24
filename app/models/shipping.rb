class Shipping < ApplicationRecord
  belongs_to :order

  # with_options presence: true do
  #   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  #   validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  #   validates :city
  #   validates :adresses
  #   validates :phone_number, format: {with: ^0\d{9,10}$, message: "is invalid.Input only number"}
  # end

end