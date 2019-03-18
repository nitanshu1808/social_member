# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  def new
    super
  end

  protected

  def after_sign_in_path_for(resource)
    admin_members_path
  end

  def after_sign_out_path_for( resource )
    new_admin_session_path
  end

end
