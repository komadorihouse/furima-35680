require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @user.save
  end
  describe '商品出品機能' do

    context '商品が出品できる場合' do

      it '商品情報が全てが入力されていると出品できる' do
        @item.user_id = @user.id
        expect(@item).to be_valid
      end

      it '商品名が４０文字以内だと出品できる' do
        @item.product_name = 'サンプル商品です'
        expect(@item).to be_valid
      end

      it '商品説明が1000文字以内であれば出品できる' do
        @item.product_descrip = "これはサンプル商品であり、売り物ではありません。これはテスト用の説明です。"
        expect(@item).to be_valid
      end
    
      it '販売価格は、¥300~¥9,999,999の間であれば出品できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do

      it '商品画像が無いと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空白だと出品できない' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空白だと出品できない' do
        @item.product_descrip = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product descrip can't be blank", "Product descrip is too short (minimum is 1 character)")
      end

      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it '商品の状態が未選択だと出品できない' do
        @item.product_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status must be other than 0")
      end

      it '配送料の負担が未選択だと出品できない' do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 0")
      end

      it '発送先の地域が未選択だと出品できない' do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 0")
      end

      it '発送までの日数が未選択だと出品できない' do
        @item.shipping_period_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping period must be other than 0")
      end

      it '販売価格が299円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が10,000,000円以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '販売価格の入力が半角数字以外では出品できない' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end
