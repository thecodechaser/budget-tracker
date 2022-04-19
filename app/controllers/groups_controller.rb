class GroupsController < ApplicationController

  def index
    @groups = current_user.groups.all
  end

  def new
    @group = Group.new
  end

  def create

  end
end