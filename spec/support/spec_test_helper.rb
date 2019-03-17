module SpecTestHelper
  def log_in( user )
    fill_in I18n.t("model.admin.email"),         :with => user.email
    fill_in I18n.t("model.admin.password"),      :with => user.password
    click_button I18n.t("app.sign_in")
    expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
    expect(page).to have_link(I18n.t("app.log_out"), href: destroy_admin_session_path)
  end

  def log_out
    click_link I18n.t("app.log_out")
    expect(page).to have_content(I18n.t("devise.sessions.signed_out"))    
  end
end
