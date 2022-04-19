class GroupsController < ApplicationController

  def index
    @groups = current_user.groups.all
  end
end