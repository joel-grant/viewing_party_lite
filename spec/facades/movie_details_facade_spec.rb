require 'rails_helper'

RSpec.describe MovieDetailsFacade do

  it 'find_runtime', :vcr do
    movie = MovieFacade.all_movies.first

    expect(MovieDetailsFacade.find_runtime(movie.db_id)).to eq(123)
  end

end
