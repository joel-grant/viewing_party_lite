class User < ApplicationRecord
  validates_presence_of :name,
                        :email
                        
  has_many :user_parties
  has_many :parties, through: :user_parties

  def invites
    parties
      .where('user_parties.status = ?', 'Invited')
  end

  def hosting
    parties
      .where('user_parties.status = ?', 'Host')
  end
end
