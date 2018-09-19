class Teamuser < ApplicationRecord
  belongs_to :team
  belongs_to :user, optional: true
  has_many :jokes
end
