class CreateDeckCards < ActiveRecord::Migration
  def change
    create_table :deck_cards do |t|
      t.references :card
      t.references :deck
      t.integer   :position
    end

    remove_index :decks, :card_id

    remove_column :decks, :card_id

    remove_column :decks, :order

    rename_column :cards, :order, :position
  end
end
