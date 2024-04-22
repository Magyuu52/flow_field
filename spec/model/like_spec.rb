require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'データの保存機能' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    let(:like) { create(:like, post_id: post.id, user_id: user.id) }
  end
end