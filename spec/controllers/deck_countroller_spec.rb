require 'spec_helper'

describe DecksController do

  describe "GET index" do

    # context "with authenticated user"   
    # context "with unauthenticated user"

    before do 
      100.times do
        card = Fabricate(:card)
      end

      10.times do
        deck = Fabricate(:deck)
      end
    end


    it "retrieves @decks" do
      get :index
      expect(assigns(:decks).first).to be_instance_of(Deck)
    end

    it "retrieves correct deck count" do
      get :index
      expect(assigns(:decks).size).to eq(10)
    end
  end

  describe "POST create" do

    before do 
      10.times do
        card = Fabricate(:card)
      end
    end

    context "with invalid input" do

      it "sets errors in @deck" do
        post :create, deck: {description: ''}
        expect(assigns(:deck).errors.any?).to be_truthy
      end

      it "does not create deck" do
        post :create, deck: {description: ''}
        expect(Deck.all.count).to eq(0)
      end

      it "renders template new" do
        post :create, deck: {description: ''}
        expect(response).to render_template :new
      end
    end

    context "with valid input" do

      it "retrieves @deck" do
        post :create, deck: {description: 'My Deck'}
        expect(assigns(:deck)).to be_instance_of(Deck)
      end

      it "creates a deck" do
        post :create, deck: {description: 'My Deck'}
        expect(Deck.all.count).to eq(1)
      end

      it "sets a success notice" do
        post :create, deck: {description: 'My Deck'}
        expect(flash[:notice]).to eq('Deck was successfully created.')
      end

      it "redirects to newly created deck" do
        post :create, deck: {description: 'My Deck'}
        expect(response).to redirect_to assigns(:deck)
      end
    end

  end
end