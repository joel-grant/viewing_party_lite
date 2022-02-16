require 'rails_helper'

RSpec.describe 'Register User Page' do
  it 'should have a form to create a new user' do
    visit '/register'

    fill_in :name, with: 'Tim Cook'
    fill_in :email, with: 'timcook@apple.com'
    fill_in :password, with: 'user12345'
    fill_in :password_confirmation, with: 'user12345'

    click_button 'Register'

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it 'should display a detailed error message if I fail to fill in any information' do
    visit '/register'

    fill_in :name, with: ''
    fill_in :email, with: 'nobody@noone.com'
    fill_in :password, with: 'user12345'
    fill_in :password_confirmation, with: 'user12345'

    click_button 'Register'
    expect(current_path).to eq("/register")
    # save_and_open_page
    expect(page).to have_content("Name can not be blank!")
  end

  it 'should display a details error message if the passwords do not match' do
    visit '/register'

    fill_in :name, with: 'Nobody'
    fill_in :email, with: 'nobody@noone.com'
    fill_in :password, with: 'user12345'
    fill_in :password_confirmation, with: 'user123456'

    click_button 'Register'
    expect(current_path).to eq("/register")

    expect(page).to have_content("The passwords must match!")
  end

  it ' should display a detailed error message if the the password or password confirmation are blank' do
    visit '/register'

    fill_in :name, with: 'Nobody'
    fill_in :email, with: 'nobody@noone.com'
    fill_in :password, with: ''
    fill_in :password_confirmation, with: 'user12345'

    click_button 'Register'
    expect(current_path).to eq("/register")

    expect(page).to have_content("Password and/or Password Confirmation can not be blank!")
  end
end
