require 'spec_helper'

describe DeckCard do

  it {should belong_to(:card)}
  it {should belong_to(:deck)}

end
