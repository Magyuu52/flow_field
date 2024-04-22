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
  end
end