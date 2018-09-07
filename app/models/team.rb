class Team < ApplicationRecord
  has_many :teamusers
  has_many :users, through: :teamusers
  has_many :jokes
  has_many :likes, through: :jokes
end
