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
    expect(page).to have_link("#{@user_1.name}")
    expect(page).to have_link("#{@user_2.name}")
    expect(page).to have_link("#{@user_3.name}")
    expect(page).to have_link("Home Page")

    click_link "Home Page"

    expect(current_path).to eq(root_path)
  end

  it 'has a button to create a new user' do
    click_button "Create User"

    expect(current_path).to eq("/register")
  end
end
