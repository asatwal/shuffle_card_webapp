class CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all.ordered
  end
  
end
