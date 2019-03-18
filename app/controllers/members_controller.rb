class MembersController < ApplicationController
  include Memberable

  before_action :authenticate_member!

  def index
    @members = Member.others( current_member.id ).page( params["page"] )
  end

  def show
    @member     = Member.includes(:headings).find_by(id: params["id"])
    friends_and_headings
  end

  def search
    @members = Member.others( current_member.id ).match_headings( params["search"] ).page( params["page"] )
    render 'index'
  end
end
