require 'rails_helper'

RSpec.feature "Sign In & Sign Out Admin" do
  let(:admin)           { create(:admin) }

  it "authenticate admin" do
    visit "/admin"
    sign_in( admin )
    expect(page).to have_content(I18n.t("app.welcome", val: admin.name ))
  end

  it "destroys admin sesssions" do
    visit "/admin"
    sign_in( admin )
    sign_out
  end
end
