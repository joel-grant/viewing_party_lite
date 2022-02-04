require 'rails_helper'

RSpec.describe MovieDetailsService do

  it 'get_details', :vcr do
    service = MovieDetailsService.new
    movie = MovieFacade.all_movies.first

    expect(service.get_details(movie.db_id)).to be_a Hash
    expect(service.get_details(movie.db_id)[:runtime]).to be_a Integer
  end

end
