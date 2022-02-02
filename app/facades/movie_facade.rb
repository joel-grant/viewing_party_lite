class MovieFacade

  def top_40_movies
    movie_records = []

    movie_records << service.get_movies_page_one[:results]
    movie_records << service.get_movies_page_two[:results]

    movie_records = movie_records.flatten
    top_40 = movie_records.map do |data|
      Movie.new(data)
    end
  end


  def service
    @_service ||= MovieService.new
  end
end

x = MovieFacade.new
x.top_40_movies
