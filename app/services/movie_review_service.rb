require 'faraday'
require 'json'

class MovieReviewService
  def self.reviews(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['movies_api_key']}&language=en-US&page=1")

    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
