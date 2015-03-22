class Verb < Word
  has_many :euphemisms, foreign_key: :verb_id
end
