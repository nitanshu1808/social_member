require 'rails_helper'

RSpec.describe Admin::HeadingsController, type: :controller do
  describe "verifies the headings actions" do

    let(:admin)             { create(:admin) }
    let(:member)            { create(:member) }

    before :each do sign_in( admin ) end

    context "Get #index heading list" do

      before { get :index, params: {member_id: member.id} }

      before(:each) do
        create_list(:heading, 10, member: member)
      end

      it "verify http status" do
        expect(response).to have_http_status(:success)
      end

      it "assigns heading list to @headings" do
        expect(assigns(:headings).size).to eql(10)
      end
    end

  end
end
