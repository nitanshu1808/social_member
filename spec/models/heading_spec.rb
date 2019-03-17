require 'rails_helper'

RSpec.describe Heading, type: :model do
  context "validates Heading" do
    let(:member)            { create(:member) }
    let(:heading)           { build(:heading, member: member) }


    it "validates text presence" do
      heading.text = nil
      expect(heading.valid?).to eql( false )
    end

    it "validates tag presence" do
      heading.tag = nil
      expect(heading.valid?).to eql( false )
    end

    it "validates member presence" do
      heading.member = nil
      expect(heading.valid?).to eql( false )
    end

    it "validates tag value" do
      heading.tag = "h7"
      expect(heading.valid?).to eql( false )
    end

    it "saves a heading" do
      expect(heading.save).to eql( true )
    end

  end
end
