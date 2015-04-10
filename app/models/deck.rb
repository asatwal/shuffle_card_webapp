require 'pry' 

class Deck < ActiveRecord::Base
  has_many :deck_cards, dependent: :destroy
  has_many :cards, through: :deck_cards
  validates_presence_of :description

  after_create :new_deck_cards


  scope :ordered, -> { order(position: :asc) }

  def shuffle!
    deck_card_ids = deck_cards.pluck(:id)

    # Now shuffle the deck cards
    # Use time in micro seconds and the seed for random number generation
    deck_card_ids.shuffle!(random: Random.new(Time::now.usec))

    # Now save shuffled cards back to the database with new positions
    deck_card_ids.each_index do |i|
      deck_card = DeckCard.find(deck_card_ids[i])
      deck_card.update(position: i + 1)
    end

    self
  end

  protected

  def new_deck_cards
    cards = Card.all.pluck(:id, :position)

    cards.each do |card|
      DeckCard.create(card_id: card[0], deck_id: id, position: card[1])
    end
  end
end
