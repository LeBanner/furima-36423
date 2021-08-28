require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる場合' do
      it '必要な情報を入力したら出品できます' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品の説明が空の場合は登録できない' do
        @item.information = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it '画像が空の場合登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空の場合登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'カテゴリーが’---’なら登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態が’---’なら登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料の負担が’---’なら登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it '都道府県が’---’なら登録できない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Place must be other than 1')
      end
      it '配送日時が’---’なら登録できない' do
        @item.schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Schedule must be other than 1')
      end
      it '価格が空白の場合、登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it '価格が半角英数混合では登録できない' do
        @item.price = '1000yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it '価格が半角英語だけでは登録できない' do
        @item.price = 'thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it '価格が299円以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it '価格が10,000,000円以上は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
    end
  end
end
