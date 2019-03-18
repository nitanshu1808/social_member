require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe "verifies the member actions" do

    let(:member)         { create(:member) }

    before :each do sign_in( member ) end

    context "Get #index members list" do

      before(:each) do create_list(:member, 10) end

      before { get :index }

      it "verify http status" do
        expect(response).to have_http_status(:success)
      end

      it "assigns members list to @members" do
        expect(assigns(:members).size).to eql(10)
      end

    end

    context "Get #search members" do

      let(:new_member)         { create(:member) }
      let(:heading)            { new_member.headings.first }

      before { get :search, params: { headings: heading.text } }

      it "verify http status" do
        expect(response).to have_http_status(:success)
      end

      it "assigns members list to @members" do
        expect(assigns(:members)).to match_array([new_member])
      end

    end

  end
end
