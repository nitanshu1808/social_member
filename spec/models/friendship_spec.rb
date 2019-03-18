require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context "validates Friendship" do

    let(:member)          { create(:member) }
    let(:friend)          { create(:member) }
    let(:friendship)      { build(:friendship, member: member, friend: member) }
    let(:already_friend)  { build(:friendship, member: member, friend: member) }

    it "validates member presence" do
      friendship.member_id = nil
      expect(friendship.valid?).to eql( false )
    end

    it "validates friend presence" do
      friendship.friend_id = nil
      expect(friendship.valid?).to eql( false )
    end

    it "validates status presence" do
      friendship.status = nil
      expect(friendship.valid?).to eql( false )
    end

    it "restricts member in sending request to himself" do
      friendship.friend_id = member.id
      expect(friendship.valid?).to eql( false )
    end

    it "validates already friend" do
      friendship.friend_id = member.id
      expect(friendship.valid?).to eql( false )
    end
  end
end
