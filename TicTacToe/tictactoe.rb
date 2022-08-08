# TODO: modules, also, the class should have the same name as the file
class Game
  def initialize
    @turn = 1
    # TODO: Move this somewhere else:
    puts "Nombre del jugador 1:"
    @player_one_name = gets.chomp.capitalize
    puts "Nombre del jugador 2:"
    @player_two_name = gets.chomp.capitalize
    # TODO: Move this too:
    @board = Array.new(3) {Array.new(3)}
    @board[0] = (1..3).to_a
    @board[1] = (4..6).to_a
    @board[2] = (7..9).to_a
  end

  def display_board
    # TODO: "-" * n in puts:
    puts """
    -------------
    | #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} |
    -------------
    | #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} |
    -------------
    | #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} |
    -------------
    """
  end

  def play
    # TODO: "-" * n in puts:
    puts """
    ---------------------------------
    |           TicTacToe           |
    ---------------------------------
    Sé el primero en poner tu símbolo
    en tres casillas consecutivas, ya
    sean verticales, horizontales o
    diagonales.
    Ten en cuenta este tablero para
    poner tu marca:
    """
    display_board

    puts "¡Comienza el juego!"

    until @turn >= 10 do
      player_turn(@turn)
      # TODO: Turn != 10
      if @turn > 5
        three_horizontal
        three_vertical
        three_diagonal
        # TODO: Use a winnning positions array to check this
      end

      display_board
    end

    declare_result(@winner)
  end

  def player_turn(turn)
    if turn.odd?
      player_choice(@player_one_name, 'O')
    else
      player_choice(@player_two_name, 'X')
    end
  end

  def player_choice(player, symbol)
    puts "#{player}, es tu turno, ¿qué casilla quieres marcar?"
    square = gets.chomp.to_i
    # TODO: until valid_input?
    until square.between?(1, 9) && repeated?(square) == false
      puts "Las casillas disponibles están marcadas de 1 - 9,"+
      "\ningresa el número de la casilla que quieres marcar."
      square = gets.chomp.to_i
    end

    add_to_board(square, symbol)
  end

  def repeated?(square)
    return false if @turn == 1

    case square
      # TODO:
    when 1
      @board[0][0] == 'X' || @board[0][0] == 'O' ? true : false
    when 2
      @board[0][1] == 'X' || @board[0][1] == 'O' ? true : false
    when 3
      @board[0][2] == 'X' || @board[0][2] == 'O' ? true : false
    when 4
      @board[1][0] == 'X' || @board[1][0] == 'O' ? true : false
    when 5
      @board[1][1] == 'X' || @board[1][1] == 'O' ? true : false
    when 6
      @board[1][2] == 'X' || @board[1][2] == 'O' ? true : false
    when 7
      @board[2][0] == 'X' || @board[2][0] == 'O' ? true : false
    when 8
      @board[2][1] == 'X' || @board[2][1] == 'O' ? true : false
    when 9
      @board[2][2] == 'X' || @board[2][2] == 'O' ? true : false
    end
  end

  def add_to_board(square, symbol)
    case square
    when 1
      @board[0][0] = symbol
    when 2
      @board[0][1] = symbol
    when 3
      @board[0][2] = symbol
    when 4
      @board[1][0] = symbol
    when 5
      @board[1][1] = symbol
    when 6
      @board[1][2] = symbol
    when 7
      @board[2][0] = symbol
    when 8
      @board[2][1] = symbol
    when 9
      @board[2][2] = symbol
    end

    @turn += 1
  end

  def three_horizontal
    @board.each do |i|
      if i.all? {|j| j == 'X'}
        @winner = 'X'
        @turn = 10
      elsif i.all? {|j| j == 'O'}
        @winner = 'O'
        @turn = 10
      end
    end
  end

  def three_vertical
    flat = @board.flatten
    flat[0..2].each_with_index do |v, i|
      # TODO: Change 'v, i' for something a human can understand
      if v == 'X' && flat[i + 3] == 'X' && flat[i + 6] == 'X'
        @winner = 'X'
        @turn = 10
      elsif v == 'O' && flat[i + 3] == 'O' && flat[i + 6] == 'O'
        @winner = 'O'
        @turn = 10
      end
    end
  end

  def three_diagonal
    center_value = @board[1][1]

    if center_value == 'X' || center_value == 'O'
      if @board[0][0] == center_value && @board[2][2] == center_value
        @winner = center_value
        @turn = 10
      elsif @board[2][0] == center_value && @board[0][2] == center_value
        @winner = center_value
        @turn = 10
      end
    end
  end

  def declare_result(symbol)
    if symbol == 'O'
      puts "¡#{@player_one_name} gana!"
    elsif symbol == 'X'
      puts "¡#{@player_two_name} gana!"
    else
      puts "¡Es un empate!"
    end
  end

end

game = Game.new
game.play
