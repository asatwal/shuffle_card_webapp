class Card < ActiveRecord::Base
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  scope :ordered, -> { order(position: :asc) }

  def image_name
    "#{suit.downcase}_#{rank.downcase}.png"
  end

end
