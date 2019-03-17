require 'rails_helper'

RSpec.describe Member, type: :model do
  context "validates member" do

    let(:member)           { build(:member) }
    let(:existing_member)  { create(:member) }

    it "validates name presence" do
      member.name = nil
      expect(member.valid?).to eql( false )
    end

    it "validates url presence" do
      member.url = nil
      expect(member.valid?).to eql( false )
    end

    it "validates shorten url presence" do
      member.shortened_url = nil
      expect(member.valid?).to eql( false )
    end

    it "validates email presence" do
      member.email = nil
      expect(member.valid?).to eql( false )
    end

    it "validates password presence" do
      member.password = nil
      expect(member.valid?).to eql( false )
    end

    it "validates url uniqueness" do
      member.url = existing_member.url
      expect(member.valid?).to eql( false )
    end

    it "validates url format" do
      member.url = "www.localhost:3000"
      expect(member.valid?).to eql( false )
    end

    it "saves a member" do
      expect(member.save).to eql( true )
    end
  end
end
