class HomeController < ApplicationController
  before_action :verify_member, if: :current_member

  def index
    @member = Member.new
  end

  private
  def verify_member
    redirect_to members_path, notice: I18n.t("devise.failure.already_authenticated")
  end
end
