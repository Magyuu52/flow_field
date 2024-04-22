require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'データの保存機能' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    let(:like) { create(:like, post_id: post.id, user_id: user.id) }

    it 'likeモデルに必要なパラメーターが揃っていれば有効であること' do
      expect(like).to be_valid
    end

    it 'likeモデルのいいねしたユーザーのidがnilの場合は無効であること' do
      like.user_id = nil
      expect(like).to be_invalid
    end

    it 'likeモデルのいいねされた投稿のidがnilの場合は無効であること' do
      like.post_id = nil
      expect(like).to be_invalid
    end
  end
end