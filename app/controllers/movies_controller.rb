class MoviesController < ApplicationController


  def results
    @facade = MovieFacade.new
    if params[:q] == 'top20'
      @top_20 = @facade.top_20
    end
  end


  def show
    @movie = Movie.find(params[:id])
  end
end
