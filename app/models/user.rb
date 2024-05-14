class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
   validates :nickname, uniqueness: true
   # 重複しないように
   # 半角英数字混合
   validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
   # 全角ひらがな・カタカナ・漢字
   validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
   # 全角カタカナ
   validates :birth_day
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
