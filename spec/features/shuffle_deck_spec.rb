require 'spec_helper'

feature 'User creates a new deck and shuffles' do 

  scenario 'user sucessfully creates a new deck and then shuffles it'  do

    create_new_deck

    click_link 'Shuffle'
    expect(page).to have_content('Deck was successfully shuffled.')
  end

  def create_new_deck

    visit root_path
    expect(page).to have_content('List of Decks')

    click_link 'New Deck'
    fill_in 'Description', with: 'My Auto Deck'
    click_button 'Create Deck'
    expect(page).to have_content('Deck was successfully created.')
  end


end