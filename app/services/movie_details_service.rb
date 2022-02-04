class MovieDetailsService

  def get_details(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['movies_api_key']}&language=en-US")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
