require 'rails_helper'

RSpec.describe MovieAPI do

it 'exists' do
  attributes = {
    id: 5,
    title: 'Vanilla Sky',
    poster_path: 'image_url',
    genre_ids: 2,
    overview: 'description',
    vote_average: 5.0
    # runtime: 180
  }

  movie = MovieAPI.new(attributes)

  expect(movie).to be_a MovieAPI
  expect(movie.db_id).to be_a Integer
  expect(movie.title).to be_a String
  expect(movie.poster_path).to be_a String
  expect(movie.genre_ids).to be_a Integer
  expect(movie.overview).to be_a String
  expect(movie.vote_average).to be_a Float
end


end
