class MoviesController < ApplicationController


  def results
require "pry"; binding.pry
  end


  def show
    @movie = Movie.find(params[:id])
  end
end
