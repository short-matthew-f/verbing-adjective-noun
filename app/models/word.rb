class Word < ActiveRecord::Base
  self.inheritance_column = :part_of_speech
end
