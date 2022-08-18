require_relative 'gamer.rb'
require_relative 'board.rb'


class Tictactoe 
  attr_accessor :board

  def initialize
    @board = Board.new
    @gamer_1 = Gamer.new('X', 1)
    @gamer_2 = Gamer.new('O', 2)
    @interface = Interface.new
    @moves = 0
  end 
   
  def welcome 
    @interface.instructions
  end 

  def init 
    symbol_1 = @gamer_1.symbol
    symbol_2 = @gamer_2.symbol

    while true 
      move(symbol_1)
      break if @moves > 8 || @winner
      move(symbol_2) 
      break if @moves > 8 || @winner 
     end 

    if @winner
      display_winner(board,@symbol)
    else 
      display_tie(board)
    end  
  end

  def move(symbol)
    coord_X, coord_y = @interface.input(@board, symbol)

    @board.set_positon(coord_X, coord_y, symbol)
        if @board.set_positon(coord_X, coord_y, symbol)
          @winner = true 
          @symbol = symbol
        else 
          @winner = false
        end 
    @moves += 1
  end 

  def display_winner(board,symbol)
    @interface.board_display(board)
    puts "\n--Winner Winner Winner--" 
    puts "gamer whith symbol - #{symbol} - wins"        
  end

  def display_tie(board)
    @interface.board_display(board)
    puts "\n  the game is tied."   
  end 

end 

game = Tictactoe.new()
game.welcome
game.init