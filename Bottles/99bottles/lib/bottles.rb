class Bottles
  def verse(bottles)
    print_verse(bottles)
  end

  def verses(bottles, range)
    iteration = bottles
    verse = []
    while iteration >= range do
      verse << print_verse(iteration)
      iteration -= 1
    end
    verse[0..-1].join("\n").to_s
  end

  def song()
    verses(99, 0)
  end

  def print_verse(number)
    if number > 2
      <<-STRING
#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number-1} bottles of beer on the wall.
STRING
    else
      case number
      when 2
        <<-STRING
#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number-1} bottle of beer on the wall.
STRING
      when 1
        <<-STRING
#{number} bottle of beer on the wall, #{number} bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
STRING
      else
        <<-STRING
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
STRING
      end
    end
  end
end
