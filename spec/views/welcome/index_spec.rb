require 'rails_helper'

RSpec.describe "welcome index", type: :view do

  before :each do
    @user_1 = User.create!(name: 'Jimbo', email: 'jim@bo.com', password: '12345', password_confirmation: '12345')
    @user_2 = User.create!(name: 'Sally', email: 'sally@bo.com', password: '12345', password_confirmation: '12345')
    @user_3 = User.create!(name: 'Eric', email: 'eric@bo.com', password: '12345', password_confirmation: '12345')
    visit root_path
  end

  it 'links to the welcome page' do
    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_button('Create User')

    expect(page).to have_link("Home Page")

    click_link "Home Page"

    expect(current_path).to eq(root_path)
  end

  it 'has a button to create a new user' do
    click_button "Create User"

    expect(current_path).to eq("/register")
  end

  context 'as a visitor' do
    it 'does not show the list of other users' do
      visit "/"
      users = User.all

      users.each do |user|
        expect(page).to_not have_content(user.email)
      end
    end

    context 'when I visit the landing page then visit the /dashboard' do
      it 'tells me I must be logged in to access the dashboard' do
        visit "/"

        visit "/dashboard"

        expect(current_path).to eq("/")
        expect(page).to have_content("You must be logged in to access this page!")
      end
    end

    context 'when I go to to a movies page and I click the button to create a viewing party' do
      it 'displays a message that I must be logged in or registered', :vcr do
        movie = MovieFacade.all_movies.first

        visit "/movies/#{movie.db_id}"

        click_button "Create a Viewing Party"
        expect(page).to have_content("You must be logged in to perform this action!")
      end
    end
  end

  context 'as a registered user' do
    it 'shows a list of email addresses of other users' do
      visit "/"

      click_link "Log In"

      fill_in "email", with: "jim@bo.com"
      fill_in "password", with: "12345"
      click_button "Log In"

      visit "/"

      users = User.all

      users.each do |user|
        expect(page).to have_content(user.email)
      end
    end
  end
end
