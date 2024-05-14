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
     
   context '新規登録ができない' do
     it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end 
     it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'メールアドレスが重複している場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end 
     it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end 
     it 'パスワードが5文字以下では登録できない' do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end 
     it 'パスワードが英数字混合でないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
     end
     it 'パスワードとパスワード（確認用）が不一致では登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'パスワードが数字だけだと登録できない' do
      @user.password ='11111111'
      @user.password_confirmation = '11111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
     end
     it 'パスワードが英字だけだと登録できない' do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
     end
     it 'パスワードが全角だと登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
     end
     it 'メールアドレスには@が含まれていないと登録できない' do
      @user.email = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it '名字（全角）が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
     end
     it '名前（全角）が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it '名字（カナ）が空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
     end
     it '名前（カナ）が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it '名字が全角でないと登録できない' do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
     end
     it '名前が全角でないと登録できない' do
      @user.first_name = 'rikutarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
     end
     it '名字が全角カナでないと登録できない' do
      @user.family_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
     end
     it '名前が全角カナでないと登録できない' do
      @user.first_name_kana = 'りくたろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
     end
     it '生年月日が空欄だと保存できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
   end
  end
end
