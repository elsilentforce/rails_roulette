class User < ActiveRecord::Base
  has_many :matches
  has_many :games, through: :matches

  validates :username, uniqueness: true
end
