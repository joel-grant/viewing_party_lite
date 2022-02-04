class MoviesController < ApplicationController
  def results
    @user = User.find(params[:id])

    if params[:q] == 'top20'
      @results = MovieFacade.top_20
    elsif params[:keyword]
      @results = MovieFacade.search(params[:keyword])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
  end
end
