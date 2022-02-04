class MovieCastFacade
  def self.first_10_cast_members(movie_id)
    movie = MovieCastService.cast(movie_id)
    cast_members = movie[:cast].first(10).map do |data|
      MovieCastAPI.new(data)
    end
  end
end
