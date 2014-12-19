class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    game_params = params[:game]
    file = game_params[:game_file]
    original_filename = file.original_filename
    created_filename = Time.now.strftime("%y%m%d_%H%M%S_#{original_filename}")
    File.open("upload_files/game_files/#{created_filename}","wb"){|f| f.write(file.read)}
    #@game = Game.create(title: game_params[:title], icon: game_params[:icon], group_id: game_params[:group_id], summary: game_params[:summary], version: game_params[:version], game_file: game_params[:game_file], format: game_params[:format])
    @game = Game.create(title: game_params[:title], icon: "dammy", group_id: "1", summary: game_params[:summary], version: game_params[:version], game_file: "upload_files/game_files/#{created_filename}", format: game_params[:format])
    for tag_num in 1..10
      tag_form = params[:tag]["#{tag_num}"][:name]
      if tag_form.empty?
        break
      end
      tags = Tag.where(name: tag_form).first
      if tags.nil?
        tags = Tag.create(name: tag_form)
      end
      @game.tags << tags
    end
    redirect_to game_path(@game.id)
  end

  def edit
  end

  def show
    @game = Game.where(id: params[:id]).first
    @comment = Comment.new
  end 

end
