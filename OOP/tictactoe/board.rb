require_relative 'validation.rb'

class Board
  attr_accessor :board

  def initialize
		@board = [
			[0, 0, 0], 
			[0, 0, 0],
			[0, 0, 0]
		]
  end 

  def set_positon(coord_X, coord_y, symbol)
    @board[coord_X][coord_y] = symbol
    opcion_win = [
      [board[0][0], board[0][1], board[0][2]],
      [board[1][0], board[1][1], board[1][2]],
      [board[2][0], board[2][1], board[2][2]],
      [board[0][0], board[1][0], board[2][0]],
      [board[0][1], board[1][1], board[2][1]],
      [board[0][2], board[1][2], board[2][2]],
      [board[0][0], board[1][1], board[2][2]],
      [board[2][0], board[1][1], board[0][2]]
    ]
    
    opcion_win.include? [symbol, symbol, symbol]
  end

end 

class Interface 

  def initialize
      @validation = Validation.new
  end 

  def board_display(board)
      board.board.each do |row|
        row.each do |cell|
            print "| #{cell} |" 
      end
      puts "\n---------------"
      end
  end

  def input(board, symbol)  
      valid_position = nil
      until valid_position
          board_display(board)
          puts "\n"
          puts "#{symbol}'s turn..."  
          print "Use values 00,01...22:" 
          coord_x, coord_y = gets.chomp.to_i, gets.chomp.to_i 
          valid_position =  @validation.valid_move(board,coord_x, coord_y)                          
      end 
      [coord_x,coord_y]
  end

  def instructions
		puts "\n"
    puts "-----Instructions----"
		puts "\n"
    puts "En el siguiente tablero se muestran las posiciones que deben  " +
		"\n" "digitarse para que el jugador ingrese una ficha: " 
		puts "\n"
    puts "------------------"
    puts "| 00 || 01 || 02 |"
    puts "------------------"
    puts "| 10 || 11 || 12 |"
    puts "------------------"
    puts "| 20 || 21 || 22 |"
    puts "------------------"
		puts "\n"
		puts "---End Instructions---"  
    puts "\n---------------"
  end
end 

