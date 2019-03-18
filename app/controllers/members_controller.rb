class MembersController < ApplicationController
  before_action :authenticate_member!

  include Memberable

  def index
    @members = Member.others( current_member.id ).page( params["page"] )
  end

  def search
    @members = Member.others( current_member.id ).match_headings( params["search"] ).page( params["page"] )
    render 'index'
  end
end
