module Memberable
  extend ActiveSupport::Concern

  def friends_and_headings
    @headings  = @member.headings.page( params["page"] )
    @friend    = current_member.friendships.find_by(friend_id: @member)
    @companion = current_member.companions.find_by(member_id: @member.id)
  end
end
