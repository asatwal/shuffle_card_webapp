require 'spec_helper'

describe CardsController do

  describe "GET index" do

    # context "with authenticated user"   
    # context "with unauthenticated user"

    before do 
      100.times do
        card = Fabricate(:card)
      end

      deck = Fabricate(:deck)
    end


    it "retrieves @cards" do
      get :index
      expect(assigns(:cards).first).to be_instance_of(Card)
    end

    it "retrieves correct card count from reference tables" do
      get :index
      expect(assigns(:cards).size).to eq(100)
    end
  end
end
