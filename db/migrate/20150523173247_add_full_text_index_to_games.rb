class AddFullTextIndexToGames < ActiveRecord::Migration
  def change
    add_index :games, :summary, type: :fulltext
  end
end
