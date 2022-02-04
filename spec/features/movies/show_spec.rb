require 'rails_helper'

RSpec.describe 'Movie Details page' do
  before :each do
    @movie = MovieFacade.all_movies.first
    @user = create(:user)
  end
  it 'has a button to create a viewing party that takes the user to the new viewing party page', :vcr do
    # @movie = create(:movie)
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"
    click_button "Create a Viewing Party"
  end

  it 'has a button to return to the discover page', :vcr do
    # user = create(:user)
    # movie = create(:movie)
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"
    click_button "Return to Discover Page"
    expect(current_path).to eq("/users/#{@user.id}/discover")
  end
end
