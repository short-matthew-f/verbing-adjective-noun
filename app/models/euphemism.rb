class Euphemism < ActiveRecord::Base
  belongs_to :verb, foreign_key: :verb_id
  belongs_to :adjective, foreign_key: :adjective_id
  belongs_to :noun, foreign_key: :noun_id

  def self.random
    v = Verb.order("RANDOM()").first
    a = Adjective.order("RANDOM()").first
    n = Noun.order("RANDOM()").first

    Euphemism.new(verb: v, adjective: a, noun: n)
  end

  def self.aliterative
    v = Verb.order("RANDOM()").first
    a = Adjective.order("RANDOM()").where("content LIKE '" + v.content[0] + "%'").first
    n = Noun.order("RANDOM()").where("content LIKE '" + v.content[0] + "%'").first

    Euphemism.new(verb: v, adjective: a, noun: n)
  end

  def to_s
    "#{self.verb.content} the #{self.adjective.content} #{self.noun.content}"
  end
end
