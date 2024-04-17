require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  describe 'ポスト一覧' do
    before do
      login(user)
    end

    it '自分が作成した投稿が閲覧できること' do
      visit posts_path
      expect(page).to have_content post.title
      expect(page).to have_content post.address
      expect(page).to have_content post.user.name
    end
  end
end
