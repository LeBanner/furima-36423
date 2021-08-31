require 'rails_helper'

RSpec.describe User, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @pay_post = FactoryBot.build(:purchase_transport, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    context '商品を購入できる' do
      it '必要な項目を全て記入したら購入できる' do
        expect(@purchase_transport).to be_valid
      end

      it '番地は空白でも購入できる' do
        @purchase_transport.building = ''
        expect(@purchase_transport).to be_valid
      end
    end

    context '商品を購入できない' do
      it 'トークンが空白では購入できない' do
        @purchase_transport.token = ''
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空白だと購入できない' do
        @purchase_transport.postal_code = ''
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @purchase_transport.postal_code = '8611234'
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が全角では購入できない' do
        @purchase_transport.postal_code = '８６１−１３２４'
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("Postal code is invalid")
      end

      it '市区町村が空白では購入できない' do
        @purchase_transport.city = ''
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("City can't be blank")
      end

      it '住所が空白では購入できない' do
        @purchase_transport.adress = ''
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("Adress can't be blank")
      end
      it '電話番号が空白では購入できない' do
        @purchase_transport.telephone_number = ''
        @purchase_transport.valid?
        expect(purchase_transport.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @purchase_transport.telephone_number = '000000000'
        @purchase_transport.valid?
        expect(purchase_transport.errors.full_messages).to include("Telephone number is invalid")
      end

      it '電話番号が12桁以上では購入できない' do
        @purchase_transport.telephone_number = '000000000000'
        @purchase_transport.valid?
        expect(purchase_transport.errors.full_messages).to include("Telephone number is invalid")
      end

      it '電話番号が全角では購入できない' do
        @purchase_transport.telephone_number = '０８０１２３４５６７７'
        @purchase_transport.valid?
        expect(purchase_transport.errors.full_messages).to include("Telephone number is invalid")
      end
 
      it '都道府県が’---’なら登録できない' do
        @purchase_transport.prefecture_id = 1
        @purchase_transport.valid?
        expect(@ppurchase_transport.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'user_idが空白では購入できない' do
        @purchase_transport.user_id = ''
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空白では購入できない' do
        @purchase_transport.item_id = ''
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号が空白では購入できない' do
        @purchase_transport.telephone_number = ''
        @purchase_transport.valid?
        expect(@purchase_transport.errors.full_messages).to include("Telephone number can't be blank")
      end
    end
  end
end