# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController

  def new
    super
  end

  private
  protected
  def after_sign_in_path_for(resource)
    members_path
  end

  def after_sign_out_path_for( resource )
    new_member_session_path
  end
end
