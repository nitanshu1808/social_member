# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController

  def create
    @member = Member.find_by(email:login_params["email"])
    if @member && @member.valid_password?(login_params["password"])
      flash[:notice] = I18n.t("devise.sessions.signed_in")
      sign_in_and_redirect(@member)
    else
      @member = Member.new(login_params)
      @member.errors.add(:base, I18n.t('app.wrong_credentials'))
      render 'home/index'
    end
  end

  private
  protected
  def after_sign_in_path_for(resource)
    members_path
  end

  def after_sign_out_path_for( resource )
    root_path
  end

  def login_params
    params.require(:member).permit(:email, :password)
  end
end
