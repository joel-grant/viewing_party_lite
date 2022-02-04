require 'rails_helper'

RSpec.describe MovieCastFacade do

  it '::first_10_cast_members', :vcr do
    results = MovieCastFacade.first_10_cast_members(238)
    expect(results.count).to be <= 10
  end
end
