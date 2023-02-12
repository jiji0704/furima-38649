class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }
  validates :nickname, presence: true, presence: { message: " can't be blank"}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: " can't be black"}
  validates :first_name, presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: " can't be blank"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: " can't be blank"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: " can't be blank"}
  validates :birth_date, presence: true, presence: {message: " can't be blank"} 

end
