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
      user_without_email = FactoryBot.build(:user, email: '')
      expect(user_without_email).to be_invalid
    end

    it "ユーザーのメールアドレスに「@」がない場合は無効であること" do
      user_without_at_mark_email = FactoryBot.build(:user, email: "aaa")
      expect(user_without_at_mark_email).to be_invalid
    end

    it "ユーザーのメールアドレスに「@」が二つある場合は無効であること" do
      user_with_double_at_mark_email = FactoryBot.build(:user, email: "a@@a")
      expect(user_with_double_at_mark_email).to be_invalid
    end

    it "ユーザーのメールアドレスの途中に空白がある場合は無効であること" do
      user_with_blank_email = FactoryBot.build(:user, email: "a @a")
      expect(user_with_blank_email).to be_invalid
    end

    it  '重複したメールアドレスを持つユーザーは無効であること' do
      user = FactoryBot.create(:user)
      user_duplicate_email = FactoryBot.build(:user, email: user.email)
      expect(user_duplicate_email).to be_invalid
    end

    it 'ユーザーにパスワードがない場合は無効であること' do
      user_without_password = FactoryBot.build(:user, password: '')
      expect(user_without_password).to be_invalid
    end

    it 'ユーザーのパスワードが6文字未満の場合は無効であること' do
    end
  end
end
