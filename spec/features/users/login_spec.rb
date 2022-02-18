require 'rails_helper'

RSpec.describe 'User Login Screen' do
  describe 'when I visit the landing page' do
    it 'has a link to log in' do
      visit "/"

      click_link "Log In"

      expect(current_path).to eq("/login")
    end
  end

  describe 'when I arrive at the login page' do
    it 'allows me to input my unique email and password' do
      user = User.create(
        name: 'Snoopy',
        email: 'snoopy@test.com',
        password: 'password123',
        password_confirmation: 'password123'
      )

      visit "/login"

      fill_in "email", with: "snoopy@test.com"
      fill_in "password", with: "password123"
      click_button "Log In"

      expect(current_path).to eq("/dashboard")
    end

    it 'shows a flash message if incorrect credentials are used' do
      user = User.create(
        name: 'Snoopy',
        email: 'snoopy@test.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      visit "/login"

      fill_in "email", with: "snoopy@test.co"
      fill_in "password", with: "password123"
      click_button "Log In"

      expect(current_path).to eq("/login")
      expect(page).to have_content("Incorrect Login Information")
    end

    it 'shows a flash message if the password is blank' do
      user = User.create(
        name: 'Snoopy',
        email: 'snoopy@test.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      visit "/login"

      fill_in "email", with: "snoopy@test.com"
      fill_in "password", with: ""
      click_button "Log In"

      expect(current_path).to eq("/login")
      expect(page).to have_content("Incorrect Login Information")
    end
  end
end
