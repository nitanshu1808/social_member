require 'rails_helper'

RSpec.describe Admin, type: :model do
  context "validates admin" do

    let(:admin)           { build(:admin) }
    let(:existing_admin)  { create(:admin) }

    it "validates email presence" do
      admin.email = nil
      expect(admin.valid?).to eql( false )
    end

    it "validates password presence" do
      admin.password = nil
      expect(admin.valid?).to eql( false )
    end

    it "validates email uniqueness" do
      admin.email = existing_admin.email
      expect(admin.valid?).to eql( false )
    end

    it "saves a admin" do
      expect(admin.save).to eql( true )
    end
  end
end
