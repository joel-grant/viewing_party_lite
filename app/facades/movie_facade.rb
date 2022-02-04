class MovieFacade

  def self.all_movies
    movie_data = []
    movie_data << service.get_movies_page_one[:results]
    movie_data << service.get_movies_page_two[:results]

    movie_data = movie_data.flatten

    @_all_movies = movie_data.map do |data|
      MovieAPI.new(data.slice(:id,
                           :title,
                           :poster_path,
                           :genre_ids,
                           :overview,
                           :vote_average,
                           :vote_count))
    end

    @_all_movies
  end

  def self.top_20
    sorted = all_movies.sort_by { |movie| movie.vote_average }
    sorted = sorted.reverse
    top_20 = sorted.take(20)
  end

  def self.search(query)
    json = service.movie_name_search(query)
    results = json[:results].map do |movie|
    MovieAPI.new(movie.slice(:id,
                         :title,
                         :poster_path,
                         :genre_ids,
                         :overview,
                         :vote_average,
                         :vote_count))
    end
  end

  def self.movie_id_search(id)
    @_all_movies.find { |movie| movie.db_id == id.to_i}
  end

  def self.service
    @_service ||= MovieService.new
  end

end
