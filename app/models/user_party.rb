class UserParty < ApplicationRecord
  belongs_to :user
  belongs_to :party

  # enum status: { "Invited" => 0, "Host" => 1 }
end
