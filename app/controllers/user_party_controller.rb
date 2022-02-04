class UserPartyController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
  end
end
