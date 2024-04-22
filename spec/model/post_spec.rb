require 'rails_helper'

RSpec.describe "Post", type: :model do
  describe '投稿のバリデーション関連' do
    it '必須項目のタイトルと住所がある場合は有効であること' do
      valid_post = FactoryBot.create(:post)
      expect(valid_post).to be_valid
    end

    it '投稿にタイトルがない場合は無効であること' do
      post_without_title = FactoryBot.build(:post, title: '')
      expect(post_without_title).to be_invalid
    end

    it '投稿のタイトルが30文字を超える場合は無効であること' do
      post_over_title = FactoryBot.build(:post, title: 'a' * 31)
      expect(post_over_title).to be_invalid
    end

    it '投稿に住所がない場合は無効であること' do
      post_without_address = FactoryBot.build(:post, address: '')
      expect(post_without_address).to be_invalid
    end

    it '投稿の内容文が500文字を超える場合は無効であること' do
      post_over_content = FactoryBot.build(:post, title: 'a' * 501)
      expect(post_over_content).to be_invalid
    end

    it '投稿のスポット画像に不適合のファイルを保存した場合は無効であること' do
      post_wrong_file_spot_image = FactoryBot.create(:post)
      post_wrong_file_spot_image.spot_image = fixture_file_upload('spec/fixtures/video/test_post.mp4')
      expect(post_wrong_file_spot_image).to be_invalid
    end

    it '投稿のフロー動画に不適合のファイルを保存した場合は無効であること' do
      post_wrong_file_flow_video = FactoryBot.create(:post)
      post_wrong_file_flow_video.flow_video = fixture_file_upload('spec/fixtures/image/test_post.jpg')
      expect(post_wrong_file_flow_video).to be_invalid
    end
  end

  describe '投稿のアソシエーション関連' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    it 'userモデルとの関連付けが正しく設定されていること' do
      expect(user.posts).to include post
    end
  end

  describe '投稿のインスタンスメソッド関連' do
    context 'いいね機能' do
      let(:user) { create(:user) }
      let(:liked_post) { create(:post, user: user) }
      let(:not_liked_post) { create(:post, user: user) }
      let(:other_user) { create(:user) }
      let!(:like) { create(:like, post: liked_post, user: other_user) }
      
      it 'いいねがされている投稿の場合、liked?による判定がtrueになること' do
        expect(liked_post.liked?(other_user)).to eq true
      end
    end

    context '検索機能' do
    end
  end
end