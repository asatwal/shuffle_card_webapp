require 'spec_helper'

describe Deck do

  it {should have_many(:deck_cards).dependent(:destroy)}
  it {should have_many(:cards).through(:deck_cards)}
  it {should validate_presence_of(:description)}

end

describe "#create" do
  it "Creates a deck from the cards with correct card count" do

    50.times do
      card = Fabricate(:card)
    end

    deck = Fabricate(:deck)

    expect(deck.cards.count).to eq(50)
  end
end