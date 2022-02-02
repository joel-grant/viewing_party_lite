require 'rails_helper'

RSpec.describe 'the user show page' do

  before :each do
    # @user = User.create!(name: 'Bob', email: 'bob.bob@bob.com')
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @user_4 = create(:user)

    # @movie1 = Movie.create!(name: 'Braveheart', runtime: '180', genre: 'fun', image_url: 'fff', summary: 'violent')
    # @movie2 = Movie.create!(name: 'lonelyheart', runtime: '120', genre: 'bad', image_url: 'ddd', summary: 'easy')
    # @movie3 = Movie.create!(name: 'dim sum', runtime: '30', genre: 'okay', image_url: 'bbb', summary: 'medium')
    # @movie4 = Movie.create!(name: 'racecar', runtime: '2', genre: 'mouse', image_url: 'lll', summary: 'hard')
    @movie1 = create(:movie)#(name: 'Braveheart', runtime: '180', genre: 'fun', image_url: 'fff', summary: 'violent')
    @movie2 = create(:movie)#(name: 'lonelyheart', runtime: '120', genre: 'bad', image_url: 'ddd', summary: 'easy')
    @movie3 = create(:movie)#(name: 'dim sum', runtime: '30', genre: 'okay', image_url: 'bbb', summary: 'medium')
    @movie4 = create(:movie)#(name: 'racecar', runtime: '2', genre: 'mouse', image_url: 'lll', summary: 'hard')

    @party_1 = Party.create!(duration: 100, date: '1/2/22', start_time: '06:37pm', movie_id: @movie1.id)
    @party_2 = Party.create!(duration: 50, date: '2/2/22', start_time: '06:37am', movie_id: @movie1.id)
    @party_3 = Party.create!(duration: 10, date: '3/2/22', start_time: '02:37pm', movie_id: @movie2.id)
    @party_4 = Party.create!(duration: 1000, date: '4/2/22', start_time: '00:37am', movie_id: @movie3.id)

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

    visit "/users/#{@user_1.id}"
  end

  it 'can visit the correct show page' do
    expect(current_path).to eq("/users/#{@user_1.id}")
  end

  it 'can display the user info' do
    expect(page).to have_content(@user_1.name)
    expect(page).to have_content(@user_1.email)
  end

  it 'has discover movie button' do
    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{@user_1.id}/discover")
  end

  # it 'lists viewing parties user is invited to' do
  #   within('#invited-parties') do
  #     within("#party-#{@party_1.id}") do
  #
  #     end
  #     expect(page).to have_content(@party_1.id)
  #     expect(page).to have_content(@party_2.id)
  #     expect(page).to have_content(@party_3.id)
  #     expect(page).to_not have_content(@party_4.id)
  #   end
  # end

  it 'has the event details for each party' do
    within('#invited-parties') do
      within("#party-#{@party_2.id}") do
        expect(page).to have_content(@party_2.movie.name)
        expect(page).to have_content(@party_2.date)
        expect(page).to have_content(@party_2.start_time)
        expect(page).to have_content("Party Host: #{@user_2.name}")

        expect(page).to have_content("Attendee: #{@user_1.name}")
        expect(page).to have_content("Attendee: #{@user_4.name}")
      end

      within("#party-#{@party_3.id}") do
        expect(page).to have_content(@party_3.movie.name)
        expect(page).to have_content(@party_3.date)
        expect(page).to have_content(@party_3.start_time)
        expect(page).to have_content("Party Host: #{@user_3.name}")

        expect(page).to have_content("Attendee: #{@user_1.name}")
        expect(page).to have_content("Attendee: #{@user_4.name}")
      end
    end
  end

  it 'has a movie title for each party that is a link' do
    within('#invited-parties') do
      within("#party-#{@party_2.id}") do
        click_link "#{@party_2.movie.name}"
      end
    end

    expect(current_path).to eq("/users/#{@user_1.id}/movies/#{@party_2.movie.id}")
  end

  it 'has my name in bold as an attendee' do

  end

  it 'has a section with parties that the user has created' do
    within('#created-parties') do
      within("#party-#{@party_1.id}") do
        expect(page).to have_content(@party_1.movie.name)
        expect(page).to have_content(@party_1.date)
        expect(page).to have_content(@party_1.start_time)
        expect(page).to have_content("Party Host: #{@user_1.name}")

        expect(page).to have_content("Attendee: #{@user_2.name}")
        expect(page).to have_content("Attendee: #{@user_3.name}")
      end
    end
  end
end
