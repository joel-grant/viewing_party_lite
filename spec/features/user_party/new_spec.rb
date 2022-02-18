require 'rails_helper'

RSpec.describe 'Viewing Party Create Page' do
  before :each do
    @movie = MovieFacade.all_movies.first
    @user = create(:user, name: "snoopy@test.com", email: "snoopy@test.com", password: '12345', password_confirmation: '12345')
    @name = @user.name.capitalize

    visit "/login"

    fill_in "email", with: "snoopy@test.com"
    fill_in "password", with: "12345"
    click_button "Log In"

    visit "/movies/#{@movie.db_id}/viewing-party/new"
  end

  it 'displays the movie name', :vcr do
    expect(page).to have_content(@movie.title)
  end

  it 'displays duration', :vcr do
    page.first(:css, "#duration")[:value].should eq("#{@movie.runtime}")
  end


  it 'can select a date', :vcr do
    date = Time.now
    date = date.strftime('%Y-%m-%d')
    page.first(:css, "#select_date")[:value].should eq(date)
  end

  it 'displays a start time field', :vcr do
    # page.first(:css, "#start_time")[:value].should eq(Time.now)
    expect(page).to have_content("Start time:")
  end

  it 'displays all users with checkboxes', :vcr do
    users = User.all

    users.each do |user|
      # name = user.name.first.upcase
      expect(page).to have_content(@name)
    end
  end

  it 'creates party and links to user show page', :vcr do
    fill_in :duration, with: '200'

    date = Time.now.tomorrow
    date = date.strftime('%Y-%m-%d')
    fill_in :select_date, with: date

    fill_in :start_time, with: (Time.now + 1*30*45).to_s

    check "#{@user.name}"

    click_button "Create Party"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content(@movie.title)
  end
end
