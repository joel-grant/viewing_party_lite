FactoryBot.define do

  factory :user do
    name { Faker::Lorem.characters(number:5) }
    email { Faker::Lorem.characters(number:10) }
  end

  factory :movie do
    db_id { Faker::Number.number(digits: 10) }
    title { Faker::Movie.title }
    poster_path { Faker::Lorem.characters(number:15) }
    genre_ids { Faker::Lorem.characters(number:5) }
    overview { Faker::Lorem.paragraph(sentence_count: 3) }
    vote_average { Faker::Number.number(digits: 10) }
    # runtime {"String"}
  end

  factory :party do
    duration {0}
    date {"String"}
    start_time {"String"}
    movie #random integer?
  end



  factory :review do
    movie
    author {"String"}
    description {"String"}
    rating {1.0}
  end

  factory :user_party do
    status {"String"}
    user
    party
  end
end


# trait :with_parties do
#   transient do
#     party_count { 5 }
#   end
#
#   after(:create) do |user, evaluator|
#     user.parties << create_list(:party, evaluator.party_count)
#   end
# end
# factory :user_with_parties do
#
# end
# after(:create) do |user, evaluator|
#   create_list(:user)
# end
#   def user_with_user_parties(count: 5)
#     FactoryBot.create_list(:user_party, count, user: :user)
#   end
# end
  #   transient do
  #     user_parties_count = 5
  #     user_parties {create_list(:user_party, user_party_count)}
  #   end
  #
  #   factory :user_with_user_parties do
  #     after(:create) do |user, evaluator|
  #       (0...evaluator.user_parties_count).each do |i|
  #         user.user_parties << FactoryBot.create(:user_party)
  #       end
  #     end
  #   end
  # end
