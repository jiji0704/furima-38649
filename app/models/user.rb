class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, allow_blank: true }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :birth_date, presence: true

  has_many :items
  has_many :orders

  has_many :favorites, dependent: :destroy
  
end
