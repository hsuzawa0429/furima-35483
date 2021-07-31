require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it '商品の状態についての情報が必須であること' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee is not a number")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day is not a number")
    end

    it '販売価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
    end

    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it 'カテゴリーのidが1だった場合登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態のidが1だった場合登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '配送料の負担のidが1だった場合登録できない' do
      @item.delivery_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end

    it '発送元の地域のidが1だった場合登録できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '発送までの日数のidが1だった場合登録できない' do
      @item.shipping_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end

    it '販売価格は全角文字では登録できない' do
      @item.price = 'あいAB'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '販売価格は半角英数混合では登録できない' do
      @item.price = '000aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '販売価格は半角英語だけでは登録できない' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
