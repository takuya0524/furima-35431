require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context  'ユーザ登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'family_nameが全角日本語でないと保存できない' do
      @user.family_name = 'john'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid. Input full-width characters."
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが全角日本語でないと保存できない' do
      @user.family_name = 'john'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
    end
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'family_name_kanaがひらがなでは登録できない' do
      @user.family_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid. Input full-width katakana characters."
    end
    it 'family_name_kanaが英字のみでは登録できない' do
      @user.family_name_kana = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid. Input half-width only characters."
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaがひらがなでは登録できない' do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters."
    end
    it 'first_name_kanaが英字のみでは登録できない' do
      @user.first_name_kana = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input half-width only characters."
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
   end
  end
end