module HomeHelper
  def view_profile_path( member )
    current_admin && admin_member_path( member ) || member_path( member )
  end
end
