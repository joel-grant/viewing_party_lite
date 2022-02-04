require 'rails_helper'

RSpec.describe 'Movie Details page' do
  before :each do
    @movie = MovieFacade.all_movies.first
    @user = create(:user)
  end

  it 'has a button to create a viewing party that takes the user to the new viewing party page', :vcr do
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"
    click_button "Create a Viewing Party"
    expect(current_path).to eq("/users/#{@user.id}/movies/#{@movie.db_id}/viewing-party/new")
  end

  it 'has a button to return to the discover page', :vcr do
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"
    click_button "Return to Discover Page"
    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it 'displays the movie title', :vcr do
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"

    expect(page).to have_content("Movie Title: #{@movie.title}")
  end

  it 'displays the vote average of the movie', :vcr do
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"
    expect(page).to have_content("Vote Average: #{@movie.vote_average}")
  end

  it 'displays the runtime in hours and minutes', :vcr do
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"
    expect(page).to have_content("Runtime: #{@movie.runtime}")
  end

  it 'displays the genres associated with the movie', :vcr do
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"

    within("#genres") do
      expect(page).to have_content(@movie.genre_ids[0])
      expect(page).to have_content(@movie.genre_ids[1])
      expect(page).to have_content("Drama")
      expect(page).to have_content("Romance")
    end
  end

  it 'displays the movie summary', :vcr do
    visit "/users/#{@user.id}/movies/#{@movie.db_id}"

    expect(page).to have_content(@movie.overview)
  end

  it 'displays the movies cast', :vcr do
    godfather_movie_id = 238
    visit "/users/#{@user.id}/movies/#{godfather_movie_id}"
    cast = MovieCastFacade.first_10_cast_members(godfather_movie_id)

    expect(cast.count).to be(10)

    cast.each do |cast_member|
      expect(cast_member).to be_a MovieCastAPI
    end
    # save_and_open_page
    expect(page).to have_content("Marlon Brando as Don Vito Corleone")
    expect(page).to have_content("Al Pacino as Don Michael Corleone")
    # expect(page).to have_content("James Caan as Santino \"Sonny\" Corleone")
    expect(page).to have_content("Robert Duvall as Tom Hagen")
    expect(page).to have_content("Richard S. Castellano as Pete Clemenza")
    expect(page).to have_content("Diane Keaton as Kay Adams")
    # expect(page).to have_content("Talia Shire as Constanzia \"Connie\" Corleone-Rizzine")
    expect(page).to have_content("Gianni Russo as Carlo Rizzi")
    expect(page).to have_content("Sterling Hayden as Capt. Mark McCluskey")
    # expect(page).to have_content("Al Lettieri as Virgil \"The Turk\" Sollozzo")
  end

  it 'displays the movies reviews', :vcr do
    godfather_movie_id = 238
    visit "/users/#{@user.id}/movies/#{godfather_movie_id}"
    reviews = MovieReviewFacade.reviews(godfather_movie_id)

    expect(reviews.count).to be <= 10

    reviews.each do |movie_review|
      expect(movie_review).to be_a MovieReviewAPI
      expect(movie_review.content).to be_a String
    end

    expect(page).to have_content("#{reviews.count} Reviews")
    expect(page).to have_content("Author: futuretv")
  end
end
