class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    game_params = params[:game]
    @game = Game.create(title: game_params[:title], icon: game_params[:icon], group_id: game_params[:group_id], version: game_params[:version], game_file: game_params[:game_file], format: game_params[:format], group_id: 1)
  end

  def edit
  end

  def show
    @game = Game.where(id: params[:id]).first
    @comment = Comment.new
  end 

end
