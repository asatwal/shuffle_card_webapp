require 'spec_helper'

describe Card do

  it {should have_many(:deck_cards)}
  it {should have_many(:decks).through(:deck_cards)}

end

describe "#image_name" do
  card = Fabricate(:card, rank: 'XX', suit: 'YyYy')
  it "returns the image name with suit, rank and png extension" do
    expect(card.image_name).to eq('yyyy_xx.png')
  end
end