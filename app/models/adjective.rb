class Adjective < Word
  has_many :euphemisms, foreign_key: :adjective_id
end
