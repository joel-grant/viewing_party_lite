class UserPartyController < ApplicationController

  def new
    @movie = MovieFacade.movie_id_search(params[:movie_id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash[:alert] = "You must be logged in to perform this action!"
      redirect_to "/movies/#{@movie.db_id}"
    end
    @users = User.all
  end

  def create
    party = Party.create!(duration: params[:duration].to_i,
                  date: params[:select_date],
                  start_time: params[:start_time],
                  movie_id: params[:movie_id])

    UserParty.create!(user_id: session[:user_id],
                       party_id: party.id,
                       status: "Host",)

    redirect_to "/dashboard"
  end
end
