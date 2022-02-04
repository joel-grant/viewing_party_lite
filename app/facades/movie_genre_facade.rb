class MovieGenreFacade

  def self.genres(genre_ids)
    genres = service.get_movie_genres[:genres]

    matched = []

    genre_ids.each do |id|
      genres.each do |genre|
        if id == genre[:id]
          matched << genre
        end
      end
    end
    matched
  end

  def self.service
    @_service = MovieGenreService.new
  end

end
