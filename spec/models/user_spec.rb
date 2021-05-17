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
      expect(@user.errors.full_messages).to include "Family name 全角文字を使用してください"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが全角日本語でないと保存できない' do
      @user.first_name = 'john'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'family_name_kanaがひらがなでは登録できない' do
      @user.family_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana 全角文字を使用してください"
    end
    it 'family_name_kanaが英字のみでは登録できない' do
      @user.family_name_kana = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana 全角文字を使用してください"
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaがひらがなでは登録できない' do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana 全角文字を使用してください"
    end
    it 'first_name_kanaが英字のみでは登録できない' do
      @user.first_name_kana = 't'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana 全角文字を使用してください"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが既に登録されているアドレスは登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailが@が含まれていないと登録できないこと' do
      @user.email = 'testa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが6文字未満だと登録できない' do
      @user.password = 'a0000'
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが数字のみだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'passwordが英字のみだと登録できない' do
      @user.password = 'tttttt'
      @user.password_confirmation = 'tttttt'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'passwordが全角だと登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
   end
  end
end