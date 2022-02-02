class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  belongs_to :movie
end
