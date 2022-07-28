=begin

Primero implementar la logica del juego:
	- tablero: matriz con numeros del 1 al 9 o algo (parecido).
	- XO: intercambiar la posición elegida por X u O.
	- 
Segundo implementar clases humano y computadora:
	-


=end

class Board
	$board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
	@@freePositions = $board.length * $board[0].length
	@@usedPositions = []

	def display_board

		# este método imprime el tablero y para efectos de desarrollo las posiciones libres
		# restantes

		separator = "---+---+---+"

		$board.each do |x|
			x.each do |y|
				print " #{y} |"
			end
			puts "\n#{separator}" 
		end
		puts "\nPosiciones restantes #{@@freePositions}"
	end

	def update(position, symbol)

		# Este método valida que el simbolo sea X u O, valida que la posición ingresada 
		# esté disponible y si todo esta bien, actualiza el board con el simbolo
		# ingresado y disminuye en 1 las posiciones libres.

		if symbol == "X" || symbol == "O" && symbol != ""
			$board.each do |x|

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
		else
			puts "Debe ingresar un simbolo válido"
		end

		
	end

	def positionsCheck
		# Este método retornará true si es posible ingresar mas 
		# símbolos en el tablero, de lo contrario false.

		@@freePositions > 0 ? true : false

	end

	def validatePosition(position)
		
		if @@usedPositions.include?(position)
			false
		else
			@@usedPositions.push(position)
			true
		end
	end

	def threeOnLineCheck

		# horizontal y vertical

		$board.each do |x|
			x.each_with_index do |y, i|
				
			end
			 
		end


		# Diagonal

	end
end

class Computer



end

board = Board.new

# Pedimos simbolo y posicion a reemplazar



while board.positionsCheck

	simbolos = {1 => "X", 2 => "O"}
	
	simbolo = rand(1..2)

	posicion = rand(1..9)

	if board.validatePosition(posicion)

		puts "\nLa computadora escogio la posición #{posicion} simbolo #{simbolos[simbolo]}"
		board.update(posicion, simbolos[simbolo])
	end
	
end

board.display_board