require 'rails_helper'

RSpec.describe "User", type: :model do
  describe 'ユーザーのバリデーション関連' do
    it '必須項目の名前とメールアドレスとパスワードがある場合は有効であること' do
      valid_user = FactoryBot.build(:user)
      expect(valid_user).to be_valid
    end
  end
end
