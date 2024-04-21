require 'rails_helper'

RSpec.describe "User", type: :model do
  describe 'ユーザーのバリデーション関連' do
    it '必須項目の名前とメールアドレスとパスワードがある場合は有効であること' do
      valid_user = FactoryBot.build(:user)
      expect(valid_user).to be_valid
    end

    it 'ユーザーに名前がない場合は無効であること' do
      user_without_name = FactoryBot.build(:user, name: '')
      expect(user_without_name).to be_invalid
    end

    it 'ユーザーの名前が20文字を超える場合は無効であること' do
      user_over_name = FactoryBot.build(:user, name: 'a' * 21)
      expect(user_over_name).to be_invalid
    end

    it 'ユーザーにメールアドレスがない場合は無効であること' do
    end
  end
end
