require 'rails_helper'

RSpec.describe 'Viewing Party Create Page' do
  before :each do
    @movie = MovieFacade.all_movies.first
    @user = create(:user)
  end
  it 'displays the movie title', :vcr do
    # user = create(:user)
    # movie = create(:movie)
    visit "/users/#{@user.id}/movies/#{@movie.db_id}/viewing-party/new"
    # click_button "Create A Viewing Party"

    expect(page).to have_content("Movie Title: #{@movie.title}")
  end

  it 'displays the vote average of the movie', :vcr do
    # user = create(:user)
    # movie = create(:movie)
    visit "/users/#{@user.id}/movies/#{@movie.db_id}/viewing-party/new"
    expect(page).to have_content("Vote Average: #{@movie.vote_average}")
  end

  # it 'displays the runtime in hours and minutes' do
  #   user = create(:user)
  #   movie = create(:movie)
  #   visit "/users/#{user.id}/movies/#{movie.id}/viewing-party/new"
  #   expect(page).to have_content("Runtime: #{movie.runtime}")
  # end

  # it 'displays the genres associated with the movie' do
  #
  # end
end
