require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date}
    it { should validate_presence_of :start_time}
  end

  describe 'relationships' do
    it { should have_many :user_parties}
    it { should have_many(:users).through(:user_parties)}
  end

  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @user_4 = create(:user)

    num = 10

    @party_1 = create(:party, movie_id: num)
    @party_2 = create(:party, movie_id: num)
    @party_3 = create(:party, movie_id: num)
    @party_4 = create(:party, movie_id: num)

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
  end

  describe '#host' do
    it 'returns the user who is the host of the party' do
      expect(@party_1.host).to eq(@user_1)
    end
  end

  describe '#attendees' do
    it 'returns a list of the invited people of a party, but not the host' do
      expect(@party_1.attendees).to eq([@user_2, @user_3])
    end
  end
end
