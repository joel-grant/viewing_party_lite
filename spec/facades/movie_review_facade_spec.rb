require 'rails_helper'

RSpec.describe MovieReviewFacade do

  it '::first_10_cast_members', :vcr do
    results = MovieReviewFacade.reviews(238)
    expect(results).to be_a Array
    results.each do |review|
      expect(review).to be_a MovieReviewAPI
    end 
  end
end
