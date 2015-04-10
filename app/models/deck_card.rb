class DeckCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :deck 

  default_scope { order(position: :asc) }
end