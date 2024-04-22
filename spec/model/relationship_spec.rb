require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'データの保存機能' do
    let(:relationship) { create(:relationship) }
    
    it 'relationモデルに必要なパラメーターが揃っていれば有効であること' do
      expect(relationship).to be_valid
    end

    it 'relationモデルのfollower_idがnilの場合は無効であること' do
      relationship.follower_id = nil
      expect(relationship).to be_invalid
    end

    it 'relationモデルのfollowed_idがnilの場合は無効であること' do
      relationship.followed_id = nil
      expect(relationship).to be_invalid
    end
  end

  describe 'データの一意性' do
    let(:user) { create(:relationship) }
    let(:relationship) { build(:relationship) }

    it '自分自身はフォローをできないこと' do
      invalid_relationship = FactoryBot.build(:relationship, follower_id: user.follower_id, followed_id: user.followed_id)
      expect(invalid_relationship).to be_invalid
    end
  end
end