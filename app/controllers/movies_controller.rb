class MoviesController < ApplicationController
  def results

    # @user = User.find(session[:user_id])


    if params[:q] == 'top20'
      @results = MovieFacade.top_20
    else
      @results = MovieFacade.search(params[:keyword])
    end
  end

  def show
    # if session[:user_id]
      # @user = User.find(session[:user_id])
    # else
    #   flash[:alert] = "You must be logged in to perform this action!"
    # end
    @movie = MovieFacade.movie_id_search(params[:movie_id])
    @genres = MovieGenreFacade.genres(@movie.genre_ids)
    @cast = MovieCastFacade.first_10_cast_members(params[:movie_id])
    @reviews = MovieReviewFacade.reviews(params[:movie_id])

  end
end
