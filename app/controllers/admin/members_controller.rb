class Admin::MembersController < AdminController
  def index
    @members = Member.page( params["page"] )
  end
end
