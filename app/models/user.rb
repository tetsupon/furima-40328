class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

   validates :nickname, uniqueness: true

   validates :email,    uniqueness: true
   # 重複しないように

   validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
   # 半角英数字混合

   validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
   # 全角ひらがな・カタカナ・漢字

   validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
   # 全角カタカナ

   validates :birth_day
  end 
end
