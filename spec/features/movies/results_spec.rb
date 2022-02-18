require 'rails_helper'

RSpec.describe 'the movie results page' do
  before :each do

    @user_1 = create(:user, name: "snoopy@test.com", email: "snoopy@test.com", password: '12345', password_confirmation: '12345')
    @user_2 = create(:user, password: '12345', password_confirmation: '12345')
    @user_3 = create(:user, password: '12345', password_confirmation: '12345')
    @user_4 = create(:user, password: '12345', password_confirmation: '12345')

    @movie1 = MovieFacade.all_movies.first
    @movie2 = MovieFacade.all_movies.second
    @movie3 = MovieFacade.all_movies.third
    @movie4 = MovieFacade.all_movies.fourth

    @party_1 = create(:party, movie_id: @movie1.db_id)
    @party_2 = create(:party, movie_id: @movie1.db_id)
    @party_3 = create(:party, movie_id: @movie2.db_id)
    @party_4 = create(:party, movie_id: @movie3.db_id)

    @user_party_1 = create(:user_party, user_id: @user_1.id, party_id: @party_1.id, status: "Host")
    @user_party_2 = create(:user_party, user_id: @user_1.id, party_id: @party_2.id)
    @user_party_3 = create(:user_party, user_id: @user_1.id, party_id: @party_3.id)
    @user_party_4 = create(:user_party, user_id: @user_2.id, party_id: @party_1.id)
    @user_party_5 = create(:user_party, user_id: @user_2.id, party_id: @party_2.id, status: "Host")
    @user_party_6 = create(:user_party, user_id: @user_2.id, party_id: @party_4.id)
    @user_party_7 = create(:user_party, user_id: @user_3.id, party_id: @party_1.id)
    @user_party_8 = create(:user_party, user_id: @user_3.id, party_id: @party_3.id, status: "Host")
    @user_party_9 = create(:user_party, user_id: @user_3.id, party_id: @party_4.id)
    @user_party_10 = create(:user_party, user_id: @user_4.id, party_id: @party_2.id)
    @user_party_11 = create(:user_party, user_id: @user_4.id, party_id: @party_3.id)
    @user_party_12 = create(:user_party, user_id: @user_4.id, party_id: @party_4.id, status: "Host")

    visit "/login"

    fill_in "email", with: "snoopy@test.com"
    fill_in "password", with: "12345"
    click_button "Log In"
  end

  it 'lists top 20 movie titles and ratings', :vcr do
    visit "/discover"
      click_button "Top Rated Movies"

      within('#movie-results') do
        @movies = MovieFacade.top_20
        @movies.each do |movie|
          expect(page).to have_content(movie.title)
          expect(page).to have_content("Rating: #{movie.vote_average}")
        end
    end
  end

  it 'displays the results of a keyword search', :vcr do
    visit "/discover"

    fill_in :keyword, with: "True Lies"
    click_button "Search"

    expect(current_path).to eq("/movies")

    within("#movie-results") do
      expect(page).to have_content("True")
      expect(page).to have_content("Lies")
    end
  end

  it 'has a link to return to the discover page', :vcr do
    visit "/discover"

    fill_in :keyword, with: "True Lies"
    click_button "Search"

    expect(current_path).to eq("/movies")

    click_button "Return to Discover Page"
    expect(current_path).to eq("/discover")
  end

  it 'links to a movies detail page from top rated', :vcr do
    visit "/discover"

    fill_in :keyword, with: "#{@movie1.title}"
    click_button "Search"

    click_link("#{@movie1.title}")

    expect(current_path).to eq("/movies/#{@movie1.db_id}")
  end
end
