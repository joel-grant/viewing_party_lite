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
end
