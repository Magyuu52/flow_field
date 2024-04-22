require 'rails_helper'

RSpec.describe "Post", type: :model do
  describe '投稿のバリデーション関連' do
    it '必須項目のタイトルと住所がある場合は有効であること' do
      valid_post = FactoryBot.create(:post)
      expect(valid_post).to be_valid
    end

    it '投稿にタイトルがない場合は無効であること' do
    end
  end
end