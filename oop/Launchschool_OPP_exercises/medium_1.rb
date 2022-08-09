# 1.
class Machine

  private

  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# 2.
class FixedArray

  def initialize(size)
    @array = Array.new(size)
  end

  def [](index)
   @array.fetch(index)
  end

  def []=(index, value)
    if index < @array.length
      @array[index] = value
    else
      raise IndexError
    end
  end

  def to_a
    @array.to_a
  end

  def to_s
    "#{@array}"
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

# 3.
class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super(name, year)
  end
end

# 4.
class CircularQueue
  def initialize(size)
    @data = []
    @size = size
  end

  def enqueue(item)
    if @data.length < @size
      @data.unshift(item)
    else
      @data.pop
      @data.unshift(item)
    end
  end

  def dequeue
    return @data.pop
  end

end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# 5.
class Minilang
  def initialize(command)
    @data = command.split
    @stack = []
    @register = 0
  end

  def n(num)
    @register = num
  end

  def push
    @stack.push(@register)
  end

  def add
    value = @stack.pop + @register
    @register = value
  end

  def sub
    value = @register - @stack.pop
    @register = value
  end

  def mult
    value = @stack.pop * @register
    @register = value
  end

  def div
    if @register != 0
      value = @register / @stack.pop
      @register = value
    end
  end

  def mod
    if @register != 0
      value = @register % @stack.pop
      @register = value
    end
  end

  def pop
    @register = @stack.pop
  end

  def print
    if @register == nil
      puts "Empty stack!"
    else
      puts "#{@register}"
    end
  end

  def eval
    @data.each_with_index do |element, index|
      if element =~ /\A[-+]?\d+\z/
         n(element.to_i)
      else
        case element
        when "PRINT"
          print
        when "PUSH"
          push
        when "ADD"
          add
        when "SUB"
          sub
        when "MULT"
          mult
        when "DIV"
          div
        when "MOD"
          mod
        when "POP"
          pop
        else
          puts "Invalid token: #{element}"
        break
        end
      end
    end
  end

end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

# 6.
class GuessingGame
  attr_reader :remaining
  def initialize
    @remaining = 7
    @random = rand(1..100)
  end

  def play
    puts "You have #{@remaining} guesses remaining."
    print "Enter a number between 1 and 100: "
    number = gets.chomp
    @remaining -= 1
    puts @random
    while @remaining > 0
      if number =~ /\A[-+]?\d+\z/
        number.to_i
      else
        print "Invalid guess. Enter a number between 1 and 100: "
        number = gets.chomp
        next
      end
      if number.to_i > 101 || number.to_i < 1
        print "Invalid guess. Enter a number between 1 and 100: "
        number = gets.chomp
        next
      end
      if number.to_i == @random
        puts "That's the number!"
        @remaining = 0
      else
        puts "You have #{@remaining} guesses remaining."
        print "Enter a number between 1 and 100: "
        number = gets.chomp
      end
      @remaining -= 1
    end
    if @remaining == 0
      puts "You have no more guesses. You lost!"
    end
  end

end

game = GuessingGame.new
game.play

# 7.
class GuessingGame
  attr_reader :remaining
  def initialize(min, max)
    @min = min
    @max = max
    @random = rand(min..max)
    @remaining = Math.log2(@random).to_i + 1
  end

  def play
    puts "You have #{@remaining} guesses remaining."
    print "Enter a number between #{@min} and #{@max}: "
    number = gets.chomp
    @remaining -= 1
    puts @random
    while @remaining > 0
      if number =~ /\A[-+]?\d+\z/
        number.to_i
      else
        print "Invalid guess. Enter a number between #{@min} and #{@max}: "
        number = gets.chomp
        next
      end
      if number.to_i > @max || number.to_i < @min
        print "Invalid guess. Enter a number between #{@min} and #{@max}: "
        number = gets.chomp
        next
      end
      if number.to_i == @random
        puts "That's the number!"
        @remaining = 0
      else
        puts "You have #{@remaining} guesses remaining."
        print "Enter a number between #{@min} and #{@max}: "
        number = gets.chomp
      end
      @remaining -= 1
    end
    if @remaining == 0
      puts "You have no more guesses. You lost!"
    end
  end

end

game = GuessingGame.new(501, 1500)
game.play

# 8.
class Card
  include Comparable
  attr_reader :rank, :suit, :value

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other_card)
    self.value <=> other_card.value
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

# 9.
class Card
  include Comparable
  attr_reader :rank, :suit, :value

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end

  # def <=>(other_card)
  #   self.value <=> other_card.value
  # end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    build_cards
  end

  def draw
    @cards.shift
  end

  private
    def build_cards
      [:clubs, :diamonds, :spades, :hearts].each do |suit|
        (2..10).each do |number|
          @cards << Card.new(suit, number)
        end
        ["Jack", "Queen", "King", "Ace"].each do |face|
          @cards << Card.new(suit, face)
        end
      end
      @cards.shuffle!
    end


end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.

# 10.

class Card
  include Comparable
  attr_reader :rank, :suit, :value

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other_card)
    self.value <=> other_card.value
  end
end

class Deck
  attr_reader :cards
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    build_cards
  end

  def draw
    @cards.shift
  end

  private
    def build_cards
      [:clubs, :diamonds, :spades, :hearts].each do |suit|
        (2..10).each do |number|
          @cards << Card.new(suit, number)
        end
        ["Jack", "Queen", "King", "Ace"].each do |face|
          @cards << Card.new(suit, face)
        end
      end
      @cards.shuffle!
    end


end

class PokerHand
  include Comparable

  attr_reader :hand

  HANDS_RANKING = { 'Royal flush' => 10, 'Straight flush' => 9,
                    'Four of a kind' => 8, 'Full house' => 7, 'Flush' => 6,
                    'Straight' => 5, 'Three of a kind' => 4, 'Two pair' => 3,
                    'Pair' => 2, 'High card' => 1 }
  N_OF_A_KIND = { 'Four of a kind' => 4, 'Full house' => 3, 'Three of a kind' => 3,
                  'Two pair' => 2, 'Pair' => 2 }

  def initialize(cards)
    @cards = cards.clone
    @hand = deal_hand
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def <=>(other)
    hand_type_self = evaluate
    compare = HANDS_RANKING[hand_type_self] <=> HANDS_RANKING[other.evaluate]
    return compare unless compare == 0
    if N_OF_A_KIND.keys.include?(hand_type_self)
      return compare_n_of_a_kind(other, N_OF_A_KIND[hand_type_self])
    end
    compare_high_card(hand, other.hand) # works for every other hand type
  end

  # Can find best 5 cards out of all the cards passed to
  # PokerHand#initialize when instantiating a new PokerHand object
  # Returns a new PokerHand object whose @hand instance
  # variable references an array of Card objects
  def best_5_cards
    (hand + @cards).combination(5).to_a.map do |hand|
      PokerHand.new(hand)
    end.max
  end

  private

  def compare_n_of_a_kind(other, n)
    cards, remaining = split_cards_by_n_kind(hand, n)
    other_cards, other_remaining = split_cards_by_n_kind(other.hand, n)
    compare = cards.max <=> other_cards.max
    # check low pair if hand is two pair
    compare = cards.min <=> other_cards.min if compare == 0
    compare = compare_high_card(remaining, other_remaining) if compare == 0
    compare
  end

  # partitions into the cards that are involved in the n of a kind
  # and the remaining cards that can be checked for high card if
  # same ranks in n of a kind
  def split_cards_by_n_kind(hand, n)
    hand.partition { |card| hand.count(card) == n }
  end

  # pairs up highest cards in each hand and compares them until
  # one card is higher than the corresponding card in the other hand
  # or until it has compared each card and found that all are equal
  def compare_high_card(hand1, hand2)
    index = - 1
    compare = nil
    loop do
      compare = hand1.sort[index] <=> hand2.sort[index] # uses Card#<=>
      break if compare != 0 || index == -hand1.size
      index -= 1
    end
    compare
  end

  def deal_hand
    hand = []
    5.times do
      hand << @cards.draw
    end
    hand
  end

  def royal_flush?
    straight_flush? && @hand.max.rank == 'Ace'
  end

  def straight_flush?
    straight? && flush?
  end

  def n_of_a_kind?(num)
    @hand.map(&:rank).any? { |card| @hand.map(&:rank).count(card) == num }
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    @hand.map(&:suit).uniq.size == 1
  end

  def straight?
    return false if @hand.map(&:rank).uniq.size < 5
    min_rank = @hand.min.rank
    max_rank = @hand.max.rank
    Card::LOW_TO_HIGH.index(min_rank) ==
      Card::LOW_TO_HIGH.index(max_rank) - 4
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def two_pair?
    pair? && @hand.map(&:rank).uniq.size == 3
  end

  def pair?
    n_of_a_kind?(2)
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
