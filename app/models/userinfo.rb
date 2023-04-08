class Userinfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
  belongs_to :user, optional: true

  with_options presence: true do
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は不正な値です。 次のように入力してください (例 123-4567)' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :job 
  validates :hoby
  end
end
