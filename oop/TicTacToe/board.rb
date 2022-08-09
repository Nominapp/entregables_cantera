class Board
  attr_reader :positions

  def initialize
    @columns_gap = "|"
    @row_gap = "---+---+---"
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    puts "#{'-'*45}"
    @positions.each_with_index do |elem, i|
      if (i+1)%3 == 0
        puts " #{elem} "
        if i+1 != 9
          puts "#{' '*14}#{@row_gap}"
        end
      elsif (i%3) == 0
        print "#{' '*15}#{elem} #{@columns_gap}"
      else
        print " #{elem} #{@columns_gap}"
      end
    end
  end

  def mark_board(num, marker)
    if @positions[num-1] == num
      @positions[num-1] = "#{marker}"
      true
    else
      false
    end
  end

  def turn_validation?(player)
    puts "#{'-'*45}"
    print "  #{player.name} is your turn, choose a position: "

    position = gets.chomp.to_i
    available = mark_board(position, player.marker)

    if available == false
      puts "#{'-'*45}"
      puts "This selection is not avaible, please select other position"
      false
    else
      true
    end
  end

  def is_board_filled?
    check = false
    @positions.each do |elem|
      check = check || elem.is_a?(Integer)
    end
    !check
  end
end
