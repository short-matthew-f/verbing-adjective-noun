class Noun < Word
  has_many :euphemisms, foreign_key: :noun_id
end
