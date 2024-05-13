require 'rails_helper'

RSpec.describe User, type: :model do
 before do
  @user = FactoryBot.build(:user)
 end
 
  describe 'ユーザー新規登録' do
   context '新規登録ができるとき' do
     it '全ての項目が入力されれば登録できる' do
      expect(@user).to be_valid
     end
     it 'パスワードが6文字以上、半角英数字混合であれば登録できる' do
       @user.password = '123abc'
       @user.password_confirmation = '123abc'
       expect(@user).to be_valid
     end
     it '名字が全角であれば登録できる'do
       @user.family_name = '山田' 
       expect(@user).to be_valid
     end  
     it '名前が全角であれば登録できる' do
       @user.first_name = '陸太郎'
       expect(@user).to be_valid
     end
     it '名字が全角カナであれば登録できる' do
       @user.family_name_kana = 'ヤマダ'
       expect(@user).to be_valid
     end
     it '名前が全角カナであれば登録できる' do
       @user.first_name_kana = 'リクタロウ' 
       expect(@user).to be_valid
     end      
   end   
  end 
end
