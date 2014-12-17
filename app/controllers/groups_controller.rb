class GroupsController < ApplicationController
  def index
  end

  def show
    @group = Group.where(id: params[:id]).first
    @games = @group.games
    @users = @group.users
  end

  def new
    @group = Group.new
    @users = @group.users
  end

  def edit
    @group = Group.where(id: params[:id]).first
    @users = @group.users
  end
end
