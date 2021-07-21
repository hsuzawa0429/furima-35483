require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "aaa@gmail.com", password: "000000", password_confirmation: "000000", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "hiro", email: "", password: "000000", password_confirmation: "000000", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "", password_confirmation: "000000", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "000000", password_confirmation: "", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "000000", password_confirmation: "000000", last_name: "", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "000000", password_confirmation: "000000", last_name: "須沢", first_name: "", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it "last_name_kanaが空では登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "000000", password_confirmation: "000000", last_name: "須沢", first_name: "啓之", last_name_kana: "", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "000000", password_confirmation: "000000", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "000000", password_confirmation: "000000", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "メールアドレスに@を含まない場合登録できない" do
      user = User.new(nickname: "hiro", email: "aaagmail.com", password: "000000", password_confirmation: "000000", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードとパスワード（確認用）の値が一致しない場合登録できない" do
      user = User.new(nickname: "hiro", email: "aaa@gmail.com", password: "000000", password_confirmation: "111111", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "重複したメールアドレスの場合登録できない" do
      User.create(nickname: "hiro", email: "aaa@gmail.com", password: "nyanchuu2002", password_confirmation: "nyanchuu2002", last_name: "須沢", first_name: "啓之", last_name_kana: "スザワ", first_name_kana: "ヒロユキ", birthday: "1975-04-29")
      @user = User.new(nickname: "sachie", email: "aaa@gmail.com", password: "nyanchuu2002", password_confirmation: "nyanchuu2002", last_name: "戸田", first_name: "幸恵", last_name_kana: "トダ", first_name_kana: "サチエ", birthday: "1978-04-02")
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
  end
end