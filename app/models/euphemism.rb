class Euphemism < ActiveRecord::Base
  belongs_to :verb, foreign_key: :verb_id
  belongs_to :adjective, foreign_key: :adjective_id
  belongs_to :noun, foreign_key: :noun_id

  def self.random(amount = 1)
    v = Verb.order("RANDOM()").take(amount)
    a = Adjective.order("RANDOM()").take(amount)
    n = Noun.order("RANDOM()").take(amount)

    return {
      verbs: v,
      adjectives: a,
      nouns: n
    }
  end

  def self.consonance(amount = 1)
    letters = ('a'..'z').to_a - ['x']
    leading_letter = letters.sample

    v = Verb.order("RANDOM()").where("content LIKE '" + leading_letter + "%'").take(amount)
    a = Adjective.order("RANDOM()").where("content LIKE '" + leading_letter + "%'").take(amount)
    n = Noun.order("RANDOM()").where("content LIKE '" + leading_letter + "%'").take(amount)

    return {
      verbs: v,
      adjectives: a,
      nouns: n
    }
  end
end
