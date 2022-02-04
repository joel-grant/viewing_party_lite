class MovieService

  def get_movies_page_one
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movies_api_key']}&language=en-US&page=1")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def get_movies_page_two
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movies_api_key']}&language=en-US&page=2")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def movie_name_search(query)
    movie_title = ERB::Util.url_encode query
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movies_api_key']}&language=en-US&query=#{movie_title}&page=1&include_adult=false")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

end
