require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context  '商品が出品できない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品画像を入力してください"
      end
      it '商品名が必須であること' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it '商品の説明が必須であること' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーは数値で入力してください"
      end
      it 'カテゴリーの情報について1が選択された場合保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーは1以外の値にしてください"
      end
      it '商品の状態についての情報が必須であること' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態は数値で入力してください"
      end
      it '商品の状態について1が選択された場合保存できないこと' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態は1以外の値にしてください"
      end
      it '配送料の負担についての情報が必須であること' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担は数値で入力してください"
      end
      it '配送料の負担について1が選択された場合保存できないこと' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担は1以外の値にしてください"
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は数値で入力してください"
      end
      it '発送元の地域について1が選択された場合保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は1以外の値にしてください"
      end
      it '発送までの日数についての情報が必須であること'do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数は数値で入力してください"
      end
      it '発送までの日数について1が選択された場合保存できないこと'do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数は1以外の値にしてください"
      end
      it '販売価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください", "販売価格は数値で入力してください"
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は300以上の値にしてください"
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は数値で入力してください"
      end
        it '販売価格は、¥10,000,000以上の場合保存できないこと' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は9999999以下の値にしてください"
      end
    end
  end
end
