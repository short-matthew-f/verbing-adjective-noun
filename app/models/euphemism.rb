class Euphemism < ActiveRecord::Base
  belongs_to :verb, foreign_key: :verb_id
  belongs_to :adjective, foreign_key: :adjective_id
  belongs_to :noun, foreign_key: :noun_id

  def self.random(count = 1)
    self.order("RANDOM()").take(count)
  end

  def to_content
    return {
      verb: self.verb.content,
      adjective: self.adjective.content,
      noun: self.noun.content
    }
  end

  def to_s
    content = self.to_content
    return "#{content[:verb]} the #{content[:adjective]} #{content[:noun]}"
  end
end
