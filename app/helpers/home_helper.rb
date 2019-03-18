module HomeHelper
  def view_heading_path( member )
    current_admin && admin_member_headings_path( member ) || "#"
  end
end
