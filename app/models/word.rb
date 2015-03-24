class Word < ActiveRecord::Base
  self.inheritance_column = :part_of_speech

  def self.random(args = {})
    self.order("RANDOM()")
        .where("content LIKE '#{args[:starting_letter]}%'")
        .take(args[:count] || 1)
  end
end
