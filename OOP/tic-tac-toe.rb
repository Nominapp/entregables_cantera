=begin

Primero implementar la logica del juego:
	- tablero: matriz con numeros del 1 al 9 o algo (parecido).
	- XO: intercambiar la posición elegida por X u O.
	- ...
	- implementa metodo para validar tres en raya de X y de O
	- crear metodo winCheck que valide las diferentes formas de hacer 3 en raya
	- 
Segundo implementar clases humano y computadora:
	- clase Humano y Computadora que hereden de Player
	- clase Humano para ingresar la posicion manualmente y escoger el simbolo deseado
	- clase Computer para generar posicion aleatoria y en caso de ser PC vs PC cambiar de turno 
	automaticamente
	- 


=end

class Board
	@@board = [
							[1, 2, 3],
							[4, 5, 6],
							[7, 8, 9]
												]

	@@freePositions = @@board.length * @@board[0].length
	@@usedPositions = []

	def display_board

		separator = "---+---+---+"

		puts

		@@board.each do |x|
			x.each do |y|
				print " #{y} |"
			end
			puts "\n#{separator}" 
		end

		puts
	end

	def update(position, symbol)
		
		@@board.each do |x|

			if x.include?(position)

				x.each_with_index do |y, i|

					if x[i] != "X" || x[i] != "O"
						if x[i] == position
							x[i] = symbol
							@@freePositions -= 1
						end
					end
				end
			end
		end
	end

	def positionsCheck
		@@freePositions > 0 ? true : false
	end

	def self.validatePosition(position)
		
		if @@usedPositions.include?(position)
			false
		else
			@@usedPositions.push(position)
			true
		end
	end

	def winCheck(symbol)
		
		@@board.each_with_index do |x, i|

			if (@@board[0][0] == symbol && @@board[0][1] == symbol && @@board[0][2] == symbol) || (@@board[1][0] == symbol && @@board[1][1] == symbol && @@board[1][2] == symbol) || (@@board[2][0] == symbol && @@board[2][1] == symbol && @@board[2][2] == symbol)
				return true
			elsif (@@board[0][0] == symbol && @@board[1][0] == symbol && @@board[2][0] == symbol) || (@@board[0][1] == symbol && @@board[1][1] == symbol && @@board[2][1] == symbol) || (@@board[0][2] == symbol && @@board[1][2] == symbol && @@board[2][2] == symbol)
				return true
			elsif (@@board[0][0] == symbol && @@board[1][1] == symbol && @@board[2][2] == symbol) || (@@board[0][2] == symbol && @@board[1][1] == symbol && @@board[2][0] == symbol)
				return true
			else
				return false
			end
		end
	end
end

class Player
	attr_reader :id

	@@count = 0

	def initialize
		@@count += 1
		@id = @@count
	end
end

class Computer < Player

	@@turns = ["X", "O"]

	def switch_turn

		@@turns.rotate!(-1)[0]
	end

	def choosePosition
		position = rand(1..9)
		position
	end

end

class Human < Player

	attr_reader :name

	def initialize(name="Default")
		super()
		@name = name
	end

	def inputName
		print "Ingrese el nombre del jugador #{self.id}: "
		@name = gets.chomp
		@name
	end

	def chooseSymbol
		loop do

			print 'Que símbolo desea usar para el juego, "X" u "O": '
			symbol = gets.chomp.upcase

			if symbol == "X" || symbol == "O"
				return symbol
				break
			else
				puts 'Símbolo inválido, ingrese "X" u "O"'
			end

		end
	end

	def inputPosition

		print "Ingrese una posición (disponible): "
		position = gets.chomp.to_i
	end
end

class Game

	def play_PCvsPC
		board = Board.new
		board.display_board
		pc1 = Computer.new

		while board.positionsCheck
			
			position = pc1.choosePosition

			if Board.validatePosition(position)
				symbol = pc1.switch_turn
				puts "Juega #{symbol} la PC escogió la posición #{position}"
				
				board.update(position, symbol)

				if board.winCheck(symbol)
					puts "#{symbol} ha ganado!!!"
					break
				end 
			end
		end
		
		board.display_board
	end

	def play_PCvsHuman
		board = Board.new
		player1 = Human.new
		pc1 = Computer.new

		player1.inputName

		symbolPlayer = player1.chooseSymbol
		symbolPlayer == "X" ? symbolPC = "O" : symbolPC = "X"
		board.display_board

		while board.positionsCheck

			loop do
				
				positionPlayer = player1.inputPosition

				if Board.validatePosition(positionPlayer) && positionPlayer.to_i != 0 && positionPlayer <= 9 && positionPlayer > 0
					board.update(positionPlayer, symbolPlayer)
					board.display_board
					if board.winCheck(symbolPlayer)
						bannerWin = Banner.new("#{player1.name.capitalize} ha ganado :D")
						puts bannerWin
					end
					break
				else
					puts "La posición ingresada no es válida o está en uso, intenta con otra :D"
				end
			end

			if board.winCheck(symbolPC) || board.winCheck(symbolPlayer)
				break
			end 
			
			loop do
				positionPC = pc1.choosePosition

				if Board.validatePosition(positionPC)
					
					puts "Juega '#{symbolPC}', la computadora escogió la posición #{positionPC}"
					
					board.update(positionPC, symbolPC)
					board.display_board
					if board.winCheck(symbolPC)
						puts "La computadora te ha ganado :("
						break
					end 
					break
					
				end
			end

			if board.winCheck(symbolPC) || board.winCheck(symbolPlayer)
				break
			end 
		end
	end

	def play_HumanVsHuman
		board = Board.new
		player1 = Human.new
		player2 = Human.new

		player1.inputName
		player2.inputName

		symbolPlayer1 = player1.chooseSymbol
		symbolPlayer1 == "X" ? symbolPlayer2 = "O" : symbolPlayer2 = "X"
		board.display_board

		while board.positionsCheck

			print "Juega #{player1.name.capitalize} "

			loop do
				
				positionPlayer1 = player1.inputPosition

				if Board.validatePosition(positionPlayer1) && positionPlayer1.to_i != 0 && positionPlayer1 <= 9 && positionPlayer1 > 0
					board.update(positionPlayer1, symbolPlayer1)
					board.display_board
					if board.winCheck(symbolPlayer1)
						bannerWinPlayer1 = Banner.new("#{player1.name.capitalize} ha ganado :D")
						puts bannerWinPlayer1
					end
					break
				else
					puts "La posición ingresada no es válida o está en uso, intenta con otra :D"
				end
			end

			if board.winCheck(symbolPlayer2) || board.winCheck(symbolPlayer1)
				break
			end 

			print "Juega #{player2.name.capitalize} "
			
			loop do
				positionPlayer2 = player2.inputPosition

				if Board.validatePosition(positionPlayer2) && positionPlayer2.to_i != 0 && positionPlayer2 <= 9 && positionPlayer2 > 0
					
					board.update(positionPlayer2, symbolPlayer2)
					board.display_board
					if board.winCheck(symbolPlayer2)
						bannerWinPlayer2 = Banner.new("#{player2.name.capitalize} ha ganado :D")
						puts bannerWinPlayer2
						break
					end 
					break
				else
					puts "La posición ingresada no es válida o está en uso, intenta con otra :D"
				end
			end

			if board.winCheck(symbolPlayer2) || board.winCheck(symbolPlayer1)
				break
			end 
		end
	end

end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-'*(@message.length + 2)}+"
  end

  def empty_line
    "|#{' '*(@message.length + 2)}|"
  end

  def message_line
    "| #{@message} |"
  end
end

class Main

	game = Game.new

	bannerStart = Banner.new('Bienvenido a Tic-Tac-Toe')
	bannerExit = Banner.new("Fin del juego.")
	banner1 = Banner.new("Computadora VS Computadora")
	banner2 = Banner.new("Humano VS Computadora")
	banner3 = Banner.new("Humano VS Humano")

	puts bannerStart

	puts "\nOpciones de juego: "

	puts "\n1. Computadora VS Computadora."
	puts "2. Humano VS Computadora."
	puts "3. Humano VS Humano."

	print "\nSeleccione que modo de juego desea (1, 2 o 3): "
	gamemode = 0

	loop do
		gamemode = gets.chomp.to_i
		if gamemode >= 1 && gamemode <= 3
			break
		else
			print "Ingrese una opción válida (1, 2 o 3): "
		end
	end

	case gamemode
	when 1
		print "\nHa seleccionado Computadora VS Computadora, presione enter para iniciar u otra tecla + enter para salir."
		start = 'no'
		start = gets.chomp
		if start == ''
			puts banner1
			puts
			game.play_PCvsPC
		else
			puts bannerExit
		end

	when 2
	  print "\nHa seleccionado Humano VS Computadora, presione enter para iniciar u otra tecla + enter para salir."
		start = 'no'
		start = gets.chomp
		if start == ''
			puts banner2
			puts
			game.play_PCvsHuman
		else
			puts bannerExit
		end
	when 3
	  print "\nHa seleccionado Humano VS Humano, presione enter para iniciar u otra tecla + enter para salir."
		start = 'no'
		start = gets.chomp
		if start == ''
			puts banner3
			puts
			game.play_HumanVsHuman
		else
			puts bannerExit
		end
	else
	  "Selecciona una opción correcta."
	end

end

