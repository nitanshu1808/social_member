class Admin::HeadingsController < AdminController
  before_action :find_member

  def index
    @headings = @member.headings.page( params["page"] )
  end

  private
  def find_member
    @member = Member.find_by(id: params["member_id"])
  end
end
