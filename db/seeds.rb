# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

v = File.open(File.join(Rails.root, "db/data/verbs.txt")).readlines.map(&:chomp)
v.each do |word|
  Verb.find_or_create_by(content: word)
end

n = File.open(File.join(Rails.root, "db/data/nouns.txt")).readlines.map(&:chomp)
n.each do |word|
  Noun.find_or_create_by(content: word)
end

a = File.open(File.join(Rails.root, "db/data/adjectives.txt")).readlines.map(&:chomp)
a.each do |word|
  Adjective.find_or_create_by(content: word)
end
