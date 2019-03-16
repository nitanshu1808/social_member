$( document ).on('turbolinks:load', function() {
  $("#new_admin").validate({
    rules: {
      "admin[email]": {
        required: true,
        email:    true
      },
      "admin[password]": {
        required:    true
      },
    }, messages: {
      "admin[email]": {
        required: I18n.t("app.enter_val", {val: I18n.t("model.admin.email")}),
      },
      "admin[password]": {
        required:    I18n.t("app.enter_val", {val: I18n.t("model.admin.password")})
      },
    }
  })
})
