class AddCardIdFkIndexToDecks < ActiveRecord::Migration
  def change
    add_index :decks, :card_id
  end
end
