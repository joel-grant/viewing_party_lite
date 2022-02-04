require 'rails_helper'

RSpec.describe MovieCastService do
  it 'returns the cast of a movie', :vcr do
    results = MovieCastService.cast(863823)

    expect(results).to be_a Hash
    expect(results[:cast][0][:name]).to be_a String
  end
end
