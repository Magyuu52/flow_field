require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'データの保存機能' do
    let(:relationship) { create(:relationship) }
    
    it "relationモデルに必要なパラメーターが揃っていれば有効であること" do
    end
  end
end