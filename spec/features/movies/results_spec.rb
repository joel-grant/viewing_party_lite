require 'rails_helper'

RSpec.describe 'the movie results page' do

  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @user_4 = create(:user)

    @movie1 = create(:movie)
    @movie2 = create(:movie)
    @movie3 = create(:movie)
    @movie4 = create(:movie)

    @party_1 = create(:party, movie_id: @movie1.id)
    @party_2 = create(:party, movie_id: @movie1.id)
    @party_3 = create(:party, movie_id: @movie2.id)
    @party_4 = create(:party, movie_id: @movie3.id)

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

    visit "/users/#{@user_1.id}/discover"
  end

  it 'lists top 20 movie titles and ratings' do
    click_button "Top Rated Movies"

    within('#movie-results') do
      expect(page).to have_content('Title: Your Eyes Tell, Rating: 8.8')
      expect(page).to have_content('Title: The Shawshank Redemption, Rating: 8.7')
      expect(page).to have_content('Title: The Godfather, Rating: 8.7')
      expect(page).to have_content('Title: Dilwale Dulhania Le Jayenge, Rating: 8.7')
      expect(page).to have_content("Title: Schindler's List, Rating: 8.6")
      expect(page).to have_content("Title: Gabriel's Inferno, Rating: 8.6")
      expect(page).to have_content('Title: The Godfather: Part II, Rating: 8.6')
      expect(page).to have_content("Title: Gabriel's Inferno Part III, Rating: 8.6")
      expect(page).to have_content('Title: Hope, Rating: 8.6')
      expect(page).to have_content("Title: Gabriel's Inferno Part II, Rating: 8.6")
      expect(page).to have_content('Title: The Good, the Bad and the Ugly, Rating: 8.5')
      expect(page).to have_content('Title: The Lord of the Rings: The Return of the King, Rating: 8.5')
      expect(page).to have_content('Title: Pulp Fiction, Rating: 8.5')
      expect(page).to have_content('Title: The Dark Knight, Rating: 8.5')
      expect(page).to have_content('Title: The Green Mile, Rating: 8.5')
      expect(page).to have_content('Title: 12 Angry Men, Rating: 8.5')
      expect(page).to have_content('Title: Parasite, Rating: 8.5')
      expect(page).to have_content('Title: Given, Rating: 8.5')
      expect(page).to have_content('Title: Evangelion: 3.0+1.0 Thrice Upon a Time, Rating: 8.5')
      expect(page).to have_content('Title: Spirited Away, Rating: 8.5')
    end
  end

  it 'displays the results of a keyword search' do
    fill_in :keyword, with: "True Lies"
    click_button "Search"

    expect(current_path).to eq("/users/#{@user_1.id}/movies")

    within("#movie-results") do
      expect(page).to have_content("True")
      expect(page).to have_content("Lies")
    end
  end

  it 'has a link to return to the discover page' do
    fill_in :keyword, with: "True Lies"
    click_button "Search"

    expect(current_path).to eq("/users/#{@user_1.id}/movies")

    click_link "Return to Discover Page"
    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end
end
