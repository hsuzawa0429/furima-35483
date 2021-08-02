require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'メールアドレスに@を含まない場合登録できない' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードとパスワード（確認用）の値が一致しない場合登録できない' do
      @user.password = 'abc000'
      @user.password_confirmation = 'def111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードが６文字以上でないと登録できない' do
      @user.password = 'abc00'
      @user.password_confirmation = 'abc00'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードが英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
    end

    it 'パスワードが数字のみでは登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
    end

    it 'パスワードが数字のみでは登録できない' do
      @user.password = 'aｂc０００'
      @user.password_confirmation = 'aｂc０００'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
    end

    it 'last_nameが漢字・平仮名・カタカナ以外では登録できない' do
      @user.last_name = 'abc000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが漢字・平仮名・カタカナ以外では登録できない' do
      @user.first_name = 'abc000'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_kanaが漢字・平仮名・カタカナ以外では登録できない' do
      @user.last_name_kana = 'abc000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが漢字・平仮名・カタカナ以外では登録できない' do
      @user.first_name_kana = 'abc000'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '重複したメールアドレスの場合登録できない' do
      another_user = FactoryBot.build(:user)
      another_user.email = '＠user.email'
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email is invalid')
    end
  end
end
