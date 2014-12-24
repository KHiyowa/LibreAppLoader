class CommentsController < ApplicationController

  def new
    comment_params = params[:comment]
    @game = Game.where(id: comment_params[:game_id]).first
    @comment = @game.comments.create(contributor: comment_params[:contributor], comment: comment_params[:comment])
    redirect_to game_path(@game.id)
  end

end
