require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'トップページの表示切り替え' do
    it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること' do
      visit root_path
      expect(page).to have_content("ログイン")
      expect(page).to have_content("新規登録")
    end

    it 'ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること' do
      visit  new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      visit root_path
      visit new_user_registration_path
      expect(current_path).to eq(new_user_registration_path)
    end

    it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること' do
      visit new_user_registration_path
      fill_in 'nickname', with:@user.nickname
      fill_in 'email', with:@user.email
      fill_in 'password', with:@user.password
      fill_in 'password-confirmation', with:@user.password_confirmation
      fill_in 'last-name', with:@user.last_name
      fill_in 'first-name', with:@user.first_name
      fill_in 'last-name-kana', with:@user.last_name_kana
      fill_in 'first-name-kana', with:@user.first_name_kana
      find("#user_birth_date_1i").find("option[value='1984']").select_option
      find("#user_birth_date_2i").find("option[value='11']").select_option
      find("#user_birth_date_3i").find("option[value='5']").select_option
      find('input[name="commit"]').click
      expect(page).to have_content("ログアウト")
      expect(page).to have_content("#{@user.nickname}")
    end

    it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができること' do
      visit new_user_registration_path
      fill_in 'nickname', with:@user.nickname
      fill_in 'email', with:@user.email
      fill_in 'password', with:@user.password
      fill_in 'password-confirmation', with:@user.password_confirmation
      fill_in 'last-name', with:@user.last_name
      fill_in 'first-name', with:@user.first_name
      fill_in 'last-name-kana', with:@user.last_name_kana
      fill_in 'first-name-kana', with:@user.first_name_kana
      find("#user_birth_date_1i").find("option[value='1984']").select_option
      find("#user_birth_date_2i").find("option[value='11']").select_option
      find("#user_birth_date_3i").find("option[value='5']").select_option
      find('input[name="commit"]').click
      visit root_path
      find_link('ログアウト',href:destroy_user_session_path).click
      expect(page).to have_content("ログイン")
    end

  end
end