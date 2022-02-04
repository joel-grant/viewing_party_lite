class MovieGenreService

  def get_movie_genres
    response = Faraday.get("https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV['movies_api_key']}&language=en-US")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
