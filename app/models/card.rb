class Card < ApplicationRecord
  SUITS = %i[hearts diamonds clubs spades]
  VALUES = %i[two three four five six seven eight nine ten jack queen king ace]

  enum :card_suit, SUITS
  enum :card_value, VALUES

  scope :for_position, -> (pos) { find_by(position: pos) }

  belongs_to :deck
end
