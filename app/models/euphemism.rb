class Euphemism < ActiveRecord::Base
  belongs_to :verb, foreign_key: :verb_id
  belongs_to :adjective, foreign_key: :adjective_id
  belongs_to :noun, foreign_key: :noun_id
end
