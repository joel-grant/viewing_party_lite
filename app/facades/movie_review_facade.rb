class MovieReviewFacade
  def self.reviews(movie_id)
    results = MovieReviewService.reviews(movie_id)
    all_reviews = results[:results].map { |data| MovieReviewAPI.new(data) }
  end
end
