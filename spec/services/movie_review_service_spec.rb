require 'rails_helper'

RSpec.describe MovieReviewService do
  it 'returns review data for a movie', :vcr do
    results = MovieReviewService.reviews(238)

    expect(results).to be_a Hash
  end
end
