module Memberable
  extend ActiveSupport::Concern

  def show
    @member     = Member.includes(:headings).find_by(id: params["id"])
    @headings   = @member.headings.page( params["page"] )
    render 'members/show'
  end
end
