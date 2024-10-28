require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: [@item.id])
    end

    context '商品を購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_delivery).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'user_idが空だと購入できない' do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @order_delivery.item_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end

      it 'post_codeが空だと購入できない' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと購入できない' do
        @order_delivery.prefecture_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空だと購入できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空だと購入できない' do
        @order_delivery.street = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Street can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満なら購入できない' do
        @order_delivery.phone_number = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'phone_numberは12桁以上だと購入できない' do
        @order_delivery.phone_number = '123456789012'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'phone_numberにハイフンが含まれると購入できない' do
        @order_delivery.phone_number = '123-456-789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'phone_numberは半角数字でないと購入できない' do
        @order_delivery.phone_number = '１２３４５６７８９０'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end
