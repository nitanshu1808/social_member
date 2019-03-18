module Memberable
  extend ActiveSupport::Concern

  def friends_and_headings
    @headings   = @member.headings.page( params["page"] )
    @friends    = current_member.friendships.find_by(friend_id: @member)
    @companions = @member.companions.find_by(member_id: current_member)
  end
end


