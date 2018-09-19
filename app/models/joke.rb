class Joke < ApplicationRecord
  belongs_to :teamuser
  has_many :likes
end
