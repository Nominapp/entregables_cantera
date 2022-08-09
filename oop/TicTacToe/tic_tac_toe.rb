require './board'
require './game'
require './player'

puts "Welcome to the game TicTacToe human VS. human"
puts "#{'-'*45}"
print "Enter the name of the first player: "
player1 = gets.chomp
player_one = Player.new(player1, 'X')
print "Enter the name of the second player: "
player2 = gets.chomp
player_two = Player.new(player2, 'O')
puts "#{'-'*45}"
puts "  #{player_one.name} you will play with #{player_one.marker}"
puts "  #{player_two.name} you will play with #{player_two.marker}"

board = Board.new
turn_name = player_one.name
game_finished = false
game = Game.new
game_win = []

while game_finished == false
  game_win = game.win(board.positions)

  if game_win[0]
    if game_win[1] == "X"
      game.game_winner = player_one.name
    elsif game_win[1] == "O"
      game.game_winner = player_two.name
    end
    game_finished = true
    board.print_board
    next
  end

  if board.is_board_filled?
    game_finished = true
    board.print_board
    next
  end

  board.print_board

  if turn_name == player_one.name
    if board.turn_validation?(player_one)
      turn_name = player_two.name
      next
    end
  end

  if turn_name == player_two.name
    if board.turn_validation?(player_two)
      turn_name = player_one.name
    end
  end
end

if game.game_winner != nil
  puts "#{'-'*45}"
  puts " The game end!! The winner is #{game.game_winner}. Congratulations"
  puts "#{'-'*45}"
else
  puts "#{'-'*45}"
  puts " The game end!! It's a draw"
  puts "#{'-'*45}"
end
