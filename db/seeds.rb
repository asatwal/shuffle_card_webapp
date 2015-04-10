# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

position = 1
suits = ['Clubs', 'Spades', 'Hearts', 'Diamonds']
ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

# For all suits
suits.each do |suit|
  ranks.each do |rank|
    Card.create(suit: suit, rank: rank, position: position)
    position += 1
  end
end
