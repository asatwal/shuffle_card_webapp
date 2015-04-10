class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :destroy, :shuffle]

  def index
    @decks = Deck.all
  end

  def show
  end

  # GET /decks/new
  def new
    @deck = Deck.new
  end


  # POST /decks
  # POST /decks.json
  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      redirect_to @deck, notice: 'Deck was successfully created.'
    else
      render :new
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    redirect_to decks_url, notice: 'Deck was successfully destroyed.'
  end

  def shuffle
    @deck.shuffle!
    redirect_to @deck, notice: 'Deck was successfully shuffled.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:description)
    end
end
