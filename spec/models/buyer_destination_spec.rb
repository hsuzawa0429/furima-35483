require 'rails_helper'

RSpec.describe BuyerDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @destination = FactoryBot.build(:buyer_destination, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入' do
    context "賞品購入記録が保存できない場合" do
      it '郵便番号がないと保存できない' do
        @destination.postal_code = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it '都道府県がないと保存できない' do
        @destination.prefecture_id = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Prefecture is not a number", "Prefecture is not a number")
      end

      it '市区町村がないと保存できない' do
        @destination.city = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと保存できない' do
        @destination.address_detail = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Address detail can't be blank")
      end

      it '電話番号がないと保存できない' do
        @destination.phone_number = ''
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it '郵便番号にはハイフンがないと保存できない' do
        @destination.postal_code = '1234567'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Postal code is invalid")
      end

      it '電話番号は11桁以内の数値でないと保存できない' do
        @destination.phone_number = '123456789012'
        @destination.valid?
        expect(@destination.errors.full_messages).to include("Phone number is invalid")
      end
    end

    context "賞品購入記録が保存できる場合" do
      it '建物名はなくても保存できる' do
        @destination.building_name = ''
        expect(@destination).to be_valid
      end
    end
  end
end