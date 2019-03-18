module MembersHelper

  def friendship_link(friend, companion)
    if friend
      friend_btn( friend )
    elsif companion
      if (companion.friends? || companion.request_declined?)
        friend_btn( companion )
      else
        accept_friendship_btn(companion )
      end
    else
      friend_request_btn
    end
  end

  def friend_request_btn
    link_to I18n.t("app.send_fr"), member_friendships_path( @member ), class: "btn btn-success btn-float-left", method: :post
  end

  def friend_btn( friend )
    link_to friend.status.titleize, "javascript:void(0)", class: "btn btn-success btn-float-left"
  end

  def accept_friendship_btn( friend )
    link_to I18n.t("app.accept_fr"), friendship_path( friend, member_id: @member.id ), class: "btn btn-success btn-float-left", method: :patch
  end

end
