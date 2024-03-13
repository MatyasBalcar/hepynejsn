class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :game

  before_create :create_cards

  def create_cards
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards.build(card_suit: suit, card_value: value)
      end
    end
    shuffle_cards
  end

  def draw_card!
    card = cards.for_position(current_card)
    update! current_card: current_card + 1
    card
  end

  def shuffle_cards!
    shuffled_positions = (0..51).to_a.shuffle
    transaction do
      update! current_card: 0
      cards.each_with_index do |card, index|
        card.update! position: shuffled_positions[index]
      end
    end
  end

  def shuffle_cards
    shuffled_positions = (0..51).to_a.shuffle
    cards.each_with_index do |card, index|
      card.position = shuffled_positions[index]
    end
  end
end
