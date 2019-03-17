require 'rails_helper'

RSpec.describe Admin::MembersController, type: :controller do
  describe "verifies the co director actions" do

    let(:admin)           { create(:admin) }

    before :each do sign_in( admin ) end

    context "Get #index members list" do

      before { get :index }

      before(:each) do
        create_list(:member, 10)
      end

      it "verify http status" do
        expect(response).to have_http_status(:success)
      end

      it "assigns members list to @members" do
        expect(assigns(:members).size).to eql(10)
      end
    end

    context "Get #new Initializes a member" do

      before { get :new }

      it "verify http status" do
        expect(response).to have_http_status(:success)
      end

      it "assigns a new member to @member" do
        expect(assigns(:member).new_record?).to eql(true)
      end

      it "renders the :new template" do
        expect(response).to render_template("new")
      end
    end

    context "Post #create, Creates a member" do
      let(:member)         { build(:member, url: "https://api-ssl.bitly.com/v3/shorten" ) }
      let(:valid_params) do {  member:  member.attributes } end

      before { Member.destroy_all }

      before { post :create, params: valid_params }


      it "verify http status" do
        expect(response).to have_http_status(302)
      end

      it "saves a @member" do
        expect(assigns(:member).persisted?).to eql(true)
      end

      it "redirects to admin members" do
        expect(response).to redirect_to(admin_members_path)
      end
    end

  end
end
