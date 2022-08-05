class Card
  include Comparable
  attr_reader :rank, :suit, :value

  @@order = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    @@order.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

# CARD CLASS CASES

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards

# 2 of Hearts
# 10 of Diamonds
# Ace of Clubs

puts cards.min == Card.new(2, 'Hearts') # true
puts cards.max == Card.new('Ace', 'Clubs') # true

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts') # true
puts cards.max == Card.new(5, 'Hearts') # true

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4 # true
puts cards.max == Card.new(10, 'Clubs') # true

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds') # true
puts cards.max.rank == 'Jack'# true

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8 # true
puts cards.max.rank == 8 # true


class Deck
  @@ranks = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  @@suits = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def reset
    @deck = []
    @@suits.each do |suit|
      @@ranks.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def draw
    @deck.pop
  end
end

deck = Deck.new
decks = []
decks << deck.draw
puts decks