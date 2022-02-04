require 'rails_helper'

RSpec.describe 'Movie Details page' do
  it 'has a button to create a viewing party that takes the user to the new viewing party page' do
    @user = create(:user)
    @movie = create(:movie)
    # require 'pry'; binding.pry
    visit "/users/#{@user.id}/movies/#{@movie.id}"
    click_button "Create a Viewing Party"
  end

  it 'has a button to return to the discover page' do

  end
end
