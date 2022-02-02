# require 'active_poro'

class Movie


  attr_reader :db_id,
              :title,
              :poster_path,
              :genre,
              :runtime,
              :overview,
              :vote_average
              # :cast

  def initialize(data)
    @db_id = data[:id]
    @title = data[:title]
    @poster_path = data[:poster_path]
    @genre_ids = data[:genre_ids]
    @runtime = data[:runtime]
    @overview = data[:overview]
    @vote_average = data[:vote_average]
    # @cast = data[:cast]
  end

end
