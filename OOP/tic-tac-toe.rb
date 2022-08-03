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
	@@board = [[1, 2, 3],
						[4, 5, 6],
						[7, 8, 9]]

	@@freePositions = @@board.length * @@board[0].length
	@@usedPositions = []

	def display_board

		separator = "---+---+---+"

		@@board.each do |x|
			x.each do |y|
				print " #{y} |"
			end
			puts "\n#{separator}" 
		end
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
		board.display_board
		player1 = Human.new
		pc1 = Computer.new

		symbolPlayer = player1.chooseSymbol
		symbolPlayer == "X" ? symbolPC = "O" : symbolPC = "X"

		while board.positionsCheck

			loop do
				
				positionPlayer = player1.inputPosition

				if Board.validatePosition(positionPlayer)
					board.update(positionPlayer, symbolPlayer)
					if board.winCheck(symbolPlayer)
						puts "El jugador #{player1.id} ha ganado :D"
					end
					break
				else
					puts "La posición ingresada está en uso, intenta con otra :D"
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
		
		board.display_board
	end

end

partida = Game.new
partida.play_PCvsHuman
