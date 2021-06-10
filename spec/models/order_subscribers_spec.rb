require 'rails_helper'

RSpec.describe OrderSubscribers, type: :model do
  describe '商品購入機能のテスト' do
    before do
      @order = FactoryBot.build(:order_subscribers)
    end
    context '内容に問題がない場合'do
      it '全ての情報が正しく入力されていると購入できる' do
        expect(@order).to be_valid
      end

      it '建物名は空白でも購入できる' do
        @order.building_name = ""
        expect(@order).to be_valid
      end


    end

    context '内容に問題がある場合' do
      it 'クレジットカード情報が正しくない場合は購入できない' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '配送先の郵便番号が空白だと購入できない' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '配送先の郵便番号にハイフン(-)が含まれない場合は購入できない' do
        @order.postal_code = "1880014"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code が無効です。")
      end

      it '配送先の郵便番号に全角数字が含まれる場合は購入できない' do
        @order.postal_code = "１８８-００１４"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code が無効です。")
      end

      it '配送先の都道府県が未選択だと購入できない' do
        @order.region_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Region can't be blank")
      end

      it '配送先の市町村名が空白だと購入できない' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '配送先の番地が空白だと購入できない' do
        @order.street = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Street can't be blank")
      end

      it '配送先の電話番号が空白だと購入できない' do
        @order.phone = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end

      it '配送先の電話番号が全角数字だと購入できない' do
        @order.phone = "１２３４５６７８９０１"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone 電話番号は半角数字のみで記入してください。")
      end

      it '配送先の電話番号が文字を含んでいると購入できない' do
        @order.phone = "a1234567890"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone 電話番号は半角数字のみで記入してください。")
      end

      it '配送先の電話番号が１２桁以上だと購入できない' do
        @order.phone = 123456789012
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
    end
  end
end
