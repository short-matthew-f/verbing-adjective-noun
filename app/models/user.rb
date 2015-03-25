class User < ActiveRecord::Base
  has_many :votes
  has_many :judgements, through: :votes, source: :euphemism
end
