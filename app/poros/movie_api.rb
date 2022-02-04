# require 'active_poro'

class MovieAPI

  attr_reader :db_id,
              :title,
              :poster_path,
              :genre_ids,
              :overview,
              :vote_average

  def initialize(data)
    @db_id = data[:id]
    @title = data[:title]
    @poster_path = data[:poster_path]
    @genre_ids = data[:genre_ids]
    @overview = data[:overview]
    @vote_average = data[:vote_average]
    # @vote_count = data[:vote_count]
  end

end
