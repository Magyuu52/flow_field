require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'ユーザー新規登録' do
    context '入力情報が正しい場合' do
      it 'ユーザーの新規登録に成功すること' do
        visit new_user_path
        fill_in '名前', with: 'rails-testuser'
        fill_in 'メールアドレス', with: 'rails@example.com'
        fill_in 'パスワード', with: 'Railstest1'
        fill_in '確認用パスワード', with: 'Railstest1'
        click_on '新規登録をする'
        expect(current_path).to eq root_path
        expect(page).to have_content 'ユーザーの新規登録に成功しました'
      end
    end

    context '入力情報に誤りがある場合' do
      it 'ユーザーの新規登録に失敗すること' do
        visit new_user_path
        fill_in '名前', with: ''
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: ''
        fill_in '確認用パスワード', with: ''
        click_on '新規登録をする'
        expect(page).to have_content('名前を入力してください')
        expect(page).to have_content('メールアドレスを入力してください')
        expect(page).to have_content('パスワードを入力してください')
      end
    end
  end

  describe 'プロフィール更新' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    before do
      login(user)
    end
    
    it '自分のプロフィール画面に編集ボタンが表示されること' do
      visit user_path(user.id)
      within '.user-plofile' do
        expect(page).to have_content 'プロフィール編集'
      end
    end

    it '他のユーザープロフィール画面に編集ボタンが表示されないこと' do
      visit user_path(other_user.id)
      within '.user-plofile' do
        expect(page).to have_no_content 'プロフィール編集'
      end
    end

    it 'プロフィールを更新できること' do
    end
  end
end