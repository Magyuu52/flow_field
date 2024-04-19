require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  describe '投稿一覧' do
    before do
      login(user)
    end

    it '自分が作成した投稿が閲覧できること' do
      visit posts_path
      expect(page).to have_content post.title
      expect(page).to have_content post.address
      expect(page).to have_content post.user.name
    end

    it '他のユーザーが作成した投稿が閲覧できること' do
      visit posts_path
      expect(page).to have_content other_post.title
      expect(page).to have_content other_post.address
      expect(page).to have_content other_post.user.name
    end
  end
  
  describe '新規投稿作成機能' do
    it '新規投稿の作成ができること' do
      login(user)
      visit new_post_path
      fill_in '投稿タイトル', with: "test-post"
      fill_in '住所', with: "大阪府大阪市港区海岸通１丁目１"
      attach_file 'post[spot_image]', "spec/fixtures/image/test_post.jpg"
      click_on '投稿する'
      expect(current_path).to eq posts_path
      expect(page).to have_content '新規投稿の作成に成功しました'
      expect(page).to have_content other_post.user.name
      expect(page).to have_content post.title
    end
  end

  describe '投稿編集・更新機能' do
  end
end
