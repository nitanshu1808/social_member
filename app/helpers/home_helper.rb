module HomeHelper
  def view_profile_path( member )
    is_admin_scope? && admin_member_path( member ) || member_path( member )
  end

  def is_admin_scope?
    params["controller"] == "admin/members"
  end

  def different_members( member )
    current_member != member
  end
end
