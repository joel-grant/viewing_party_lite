class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  belongs_to :movie

  def host
    users
      .where('user_parties.status = ?', 'Host').first
  end

  def attendees
    users
      .where('user_parties.status = ?', 'Invited')
  end

end
