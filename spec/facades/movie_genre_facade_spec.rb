require 'rails_helper'

RSpec.describe MovieGenreFacade do

it 'genres', :vcr do
  movie = MovieFacade.all_movies.first

  MovieGenreFacade.genres(movie.genre_ids).each do |genre|
    expect(genre[:id]).to be_a Integer
    expect(genre[:name]).to be_a String
  end
end

end
