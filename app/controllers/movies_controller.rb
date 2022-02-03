class MoviesController < ApplicationController


  def results
    @facade = MovieFacade.new
    
    require "pry"; binding.pry
  end


  def show
    @movie = Movie.find(params[:id])
  end
end
