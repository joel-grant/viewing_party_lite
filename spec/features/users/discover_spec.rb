require 'rails_helper'

RSpec.describe 'user discover page' do

  before :each do
    @user_1 = create(:user, password: '12345', password_confirmation: '12345')
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

    visit "/users/#{@user_1.id}/discover"
  end

  it 'has a button to top rated movies', :vcr do
      click_button 'Top Rated Movies'

      expect(current_path).to eq("/users/#{@user_1.id}/movies")
  end
end
