class Admin::MembersController < AdminController
  def index
    @members = Member.page( params["page"] )
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new( member_params )
    # @member.calculate_shorten_url
  end

  private
  def member_params
    params.require(:member).permit(:name, :url)
  end
end
