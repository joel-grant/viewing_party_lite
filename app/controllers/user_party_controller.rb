class UserPartyController < ApplicationController
  def new
    @movie = MovieFacade.movie_id_search(params[:movie_id])
    # @genres = MovieGenreFacade.genres(@movie.genre_ids)
  end
end
