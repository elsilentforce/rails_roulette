class User < ActiveRecord::Base
  has_many :rounds
  has_many :games, through: :rounds

  validates :username, presence: true, uniqueness: true
end
