require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

    context 'ユーザー登録ができる時' do

      it'ニックネーム、パスワード、本名、よみがな、生年月日 が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが６文字以上であれば登録できる' do
        @user.password = "a12345"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it 'passwordが半角英数どちらも含んでいれば登録できる' do
        @user.password = "a1b2c3"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it 'last_name は全角であれば登録できる' do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end

      it 'first_name は全角であれば登録できる' do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end

      it 'last_name_kana は全角カナであれば登録できる' do
        @user.first_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it 'first_name_kana は全角カナであれば登録できる' do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end

    end

    context 'ユーザー登録ができない時' do

      it 'ニックネームが空白だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空白だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '既に登録されているメールアドレスでは新規登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含まなければ登録できない' do
        @user.email = 'furima.yahoo.co.jp'
        @user.valid?

        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが空白だと登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上でないと登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは、半角英字のみの場合登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは、確認用を含めて2回入力しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      "Password confirmation can't be blank")
      end

      it 'パスワードとパスワード（確認用）は、値の一致しなければ登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名字が空白だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end

      it 'ユーザー本名は、名前が空白だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が空白だと登録できない' do
        @user.last_name = 'yamada'
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid', 'First name is invalid')
      end

      it 'ユーザー本名のフリガナは、名字が空白だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      
      it 'ユーザー本名のフリガナは、名前が空白だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力でなければ登録できない' do
        @user.last_name_kana = 'yamada'
        @user.first_name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid', 'First name kana is invalid')
      end

      it '生年月日が空白だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
