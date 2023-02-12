class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }
  validates :nickname, presence: true, presence: { message: 'Nickname cant be black'}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: 'Lirst name cant be black'}
  validates :first_name, presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: 'Fast name cant be black'}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: 'Last name kana cant be black'}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message: 'first name kana cant be black'}
  validates :birthday, presence: true, presence: {message: 'Birth date cant be black'} 

end
