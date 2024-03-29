require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送先入力の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      sleep 0.1
      @order_shipping = FactoryBot.build(:order_shipping, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingsは空でも保存できること' do
        @order_shipping.buildings = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号は不正な値です。 次のように入力してください (例 123-4567)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('都道府県を入力してください')
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'adressesが空だと保存できないこと' do
        @order_shipping.addresses = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'phone_numberが10桁未満だと保存できないこと' do
        @order_shipping.phone_number = '090123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_shipping.phone_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが半角英字では登録できない' do
        @order_shipping.phone_number = 'aaaaaaaaaaa'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は不正な値です。数字で入力してください')
      end
      it 'phone_numberが全角数字では登録できない' do
        @order_shipping.phone_number = '０００００００００００'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は不正な値です。数字で入力してください')
      end
      it 'userが紐付いていなければ投稿できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Userを入力してください')
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Itemを入力してください')
      end
      it 'tokenが空では登録できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('カード情報を入力してください')
      end
    end
  end
end
