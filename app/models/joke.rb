class Joke < ApplicationRecord
  belongs_to :user
  has_many :likes
end
