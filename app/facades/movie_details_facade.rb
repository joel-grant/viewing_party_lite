class MovieDetailsFacade

  def self.find_runtime(movie_id)
    service.get_details(movie_id)[:runtime]
  end

  def self.service
    @_service = MovieDetailsService.new
  end


end
