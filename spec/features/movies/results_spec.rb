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

    within('#top-20-movies') do
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
    end
  end


end
