require 'rails_helper'

RSpec.feature "Sign In Admin" do
  let(:admin)           { create(:admin) }

  it "authenticate admin" do
    visit "/admin"
    sign_in( admin )
  end
end
