require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品の出品登録' do
    context '出品登録ができる' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.product_category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @item.product_condition_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @item.delivery_charge_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @item.shipping_area_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @item.shipping_day_id = 1
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品ができない' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
      end
      it '商品画像が1枚ないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.product_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Product category must be other than 0')
      end
      it 'カテゴリーの情報が空だと出品できない' do
        @item.product_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank", 'Product category is not a number')
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.product_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition must be other than 0')
      end
      it '商品の状態の情報が空だと出品できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank", 'Product condition is not a number')
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 0')
      end
      it '配送料の負担の情報が空だと出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank", 'Delivery charge is not a number')
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 0')
      end
      it '発送元の地域の情報が空だと出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 0')
      end
      it '発送までの日数の情報が空だと出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", 'Shipping day is not a number')
      end
      it '価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it "価格が全角数字では出品できない" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が半角英字では出品できない" do
        @item.price = "sample"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が半角英数字混合では出品できない" do
        @item.price = "sample1000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end