class MembersController < ApplicationController
  before_action :authenticate_member!

  def index
    @members = Member.page( params["page"] )
  end
end
