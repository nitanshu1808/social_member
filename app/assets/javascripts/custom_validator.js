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
    },
    messages: {
      "admin[email]": {
        required: I18n.t("app.enter_val", {val: I18n.t("model.admin.email")}),
      },
      "admin[password]": {
        required:    I18n.t("app.enter_val", {val: I18n.t("model.admin.password")})
      },
    }
  })

  $("#new_member").validate({
    rules: {
      "member[name]": {
        required:     true,
        lettersonly:  true
      },
      "member[url]": {
        required:    true,
        url:         true
      },
      "member[email]": {
        required: true,
        email:    true
      },
      "member[password]": {
        required:    true
      },
    },
    messages: {
      "member[name]": {
        required: I18n.t("app.enter_val", {val: I18n.t("model.member.name")}),
      },
      "member[url]": {
        required:    I18n.t("app.enter_val", {val: I18n.t("model.member.url")})
      },
      "member[email]": {
        required:    I18n.t("app.enter_val", {val: I18n.t("model.member.email")})
      },
      "member[password]": {
        required:    I18n.t("app.enter_val", {val: I18n.t("model.member.password")})
      },
    }
  })

  jQuery.validator.addMethod("lettersonly", function(value, element) {
     return this.optional(element) || /^[a-z\s]+$/i.test(value);
  }, I18n.t("errors.letters_only"));


})
