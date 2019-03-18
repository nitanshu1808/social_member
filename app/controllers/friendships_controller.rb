class FriendshipsController < ApplicationController
  include Memberable

  before_action :authenticate_member!
  before_action :find_member, only: [ :index, :create ]

  def index

  end

  def create
    friendship = current_member.friendships.build(friend: @member)
    if friendship.save
      redirect_to member_path(@member), notice: I18n.t("app.friend_req_sent")
    else
      @member.errors.add(:base, friendship.errors.full_messages)
      friends_and_headings
      render 'members/show'
    end
  end

  def update
  end

  def destroy
  end

  private
  def find_member
    @member = Member.find_by(id: params["member_id"])
  end
end
