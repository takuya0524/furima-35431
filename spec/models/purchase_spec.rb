require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば購入できる' do
        expect(@purchase).to be_valid
      end
      it '建物名が抜けていても登録できること' do
        @purchase.building_name = nil
        @purchase.valid?
        expect(@purchase).to be_valid
      end
    end

    context  '商品が購入できない時' do
      it '配送先の情報として郵便番号が必須であること' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Postal code can't be blank"
      end
      it '配送先の情報として都道府県が必須であること' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end
      it '配送先の情報として市区町村が必須であること' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "City can't be blank"
      end
      it '配送先の情報として番地が必須であること' do
        @purchase.street_address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Street address can't be blank"
      end
      it '配送先の情報として電話番号が必須であること' do
        @purchase.telephone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Telephone number can't be blank"
      end
      it '郵便番号の保存にはハイフンが必要であること' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Postal code can't be blank"
      end
      it '電話番号は11桁以内の数値のみ保存可能なこと' do
        @purchase.telephone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Telephone number can't be blank"
      end
      it 'tokenが必須であること' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空だと購入できない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと購入できない' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
