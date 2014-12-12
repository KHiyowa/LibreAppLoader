class GamesController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @game = Game.where(id: params[:id]).first
  end
end
