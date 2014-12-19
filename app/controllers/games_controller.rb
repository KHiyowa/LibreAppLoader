class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
