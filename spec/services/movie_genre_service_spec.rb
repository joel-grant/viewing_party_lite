require 'rails_helper'

RSpec.describe MovieGenreService do

  it 'get_movie_genres', :vcr do
    service = MovieGenreService.new
    results = service.get_movie_genres

    expect(results).to be_a Hash

    results[:genres].each do |genre|
      expect(genre[:id]).to be_a Integer
      expect(genre[:name]).to be_a String
    end
  end

end
