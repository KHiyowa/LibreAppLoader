class GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(10).order(:id)
  end

  def new
  end

  def edit
  end

  def show
  end
end
