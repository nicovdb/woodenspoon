class User < ApplicationRecord
  has_many :teamusers
  has_many :likes
  has_many :jokes
end
