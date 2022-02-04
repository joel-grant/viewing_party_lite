require 'rails_helper'

RSpec.describe MovieService do

  before :each do
    @service = MovieService.new
  end
  it 'get_movies_page_one', :vcr do
    results = @service.get_movies_page_one

    expect(results).to be_a Hash
    expect(results[:results][0][:original_title]).to be_a String
  end

  it 'get_movies_page_two', :vcr do
    results = @service.get_movies_page_two

    expect(results).to be_a Hash
    expect(results[:results][0][:original_title]).to be_a String
  end

  it 'movie_search', :vcr do
    query = 'shawshank'
    output = @service.movie_name_search(query)

    expect(output).to be_a Hash
    expect(output[:results][0][:original_title]).to eq('The Shawshank Redemption')
  end


end
