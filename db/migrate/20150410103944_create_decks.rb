class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :card_id
      t.integer :order
      t.string :description

      t.timestamps null: false
    end
  end
end
