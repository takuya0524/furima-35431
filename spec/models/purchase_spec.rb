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
        expect(@purchase.errors.full_messages).to include "郵便番号を入力してください", "郵便番号は不正な値です"
      end
      it '配送先の情報として都道府県が必須であること' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "都道府県を入力してください", "都道府県は数値で入力してください"
      end
      it '配送先の情報として市区町村が必須であること' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "市区町村を入力してください"
      end
      it '配送先の情報として番地が必須であること' do
        @purchase.street_address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "番地を入力してください"
      end
      it '配送先の情報として電話番号が必須であること' do
        @purchase.telephone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "電話番号を入力してください", "電話番号は不正な値です"
      end
      it '郵便番号の保存にはハイフンが必要であること' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "郵便番号を入力してください", "郵便番号は不正な値です"
      end
      it '電話番号は11桁以内の数値のみ保存可能なこと' do
        @purchase.telephone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "電話番号を入力してください", "電話番号は不正な値です"
      end
      it 'tokenが必須であること' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "カード情報を入力してください"
      end
      it 'user_idが空だと購入できない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Userを入力してください"
      end
      it 'item_idが空だと購入できない' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Itemを入力してください"
      end
    end
  end
end