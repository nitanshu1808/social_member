class Admin::MembersController < AdminController
  def index
    @members = Member.page( params["page"] )
  end

  def new
    @member = Member.new
  end

  def create
    begin
      @member               = Member.new( member_params )
      @member.shortened_url = @member.fetch_shorten_url
      if @member.save
        redirect_to admin_members_path, notice: I18n.t("app.record_created", val: I18n.t("app.member"))
      else
        render 'new'
      end
    rescue Exception => e
      @member.errors.add(:base, e.message)
      render 'new'
    end
  end

  private
  def member_params
    params.require(:member).permit(:name, :url)
  end
end
