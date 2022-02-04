class UserPartyController < ApplicationController
  def new
    @movie = MovieFacade.movie_id_search(params[:movie_id])
  end
end
