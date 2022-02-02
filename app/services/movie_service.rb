require 'faraday'
require 'json'

class MovieService
  def get_movies_page_one
    response_1 = Faraday.get('https://api.themoviedb.org/3/movie/top_rated?api_key=d45da63d73a0c3da29b1b28ef97090c3&language=en-US&page=1')
    parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
    # require "pry"; binding.pry
  end

  def get_movies_page_two
    response_2 = Faraday.get('https://api.themoviedb.org/3/movie/top_rated?api_key=d45da63d73a0c3da29b1b28ef97090c3&language=en-US&page=2')
    parsed_2 = JSON.parse(response_2.body, symbolize_names: true)
    # require "pry"; binding.pry
  end
end

# x = MovieService.new
# x.get_movies_page_one
# x.get_movies_page_two
