require 'rails_helper'

RSpec.describe 'Movie Details page' do
  it 'has a button to create a viewing party that takes the user to the new viewing party page' do
    @user = create(:user)
    @movie = create(:movie)
    visit "/users/#{@user.id}/movies/#{@movie.id}"
    click_button "Create a Viewing Party"
  end

  it 'has a button to return to the discover page' do
    user = create(:user)
    movie = create(:movie)
    visit "/users/#{user.id}/movies/#{movie.id}"
    click_button "Return to Discover Page"
    expect(current_path).to eq("/users/#{user.id}/discover")
  end
end
