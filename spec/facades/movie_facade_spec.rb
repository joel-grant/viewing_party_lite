require 'rails_helper'

RSpec.describe MovieFacade do

  it '::all_movies', :vcr do
    movies = MovieFacade.all_movies

    expect(movies).to be_a Array
    movies.each do |movie|
      expect(movie).to be_a MovieAPI
    end
  end
end
