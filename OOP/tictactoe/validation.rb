require_relative 'board.rb'

class Validation 
  # empty cells 
  def free_cells(board, coord_x, coord_y)
    cells = []

    board.board.each_with_index do |row, position_x| 
			row.each_with_index do |cell, position_y|    
				if cell == 0
          cells << [position_x, position_y]
        end
      end
    end
    return cells
  end

  def avaliable_cells(cells, coord_x, coord_y)
    cells.each do |x, y|
      if [x,y] == [coord_x,coord_y] 
        return true 
      end 
    end 
	end 
  # Coordinates is ok?
  def inputed_position(board, coord_x, coord_y)
    size_max = board.board.length 

    coord_x >= size_max || coord_y >= size_max || coord_x < 0 || coord_y < 0 ? true : false
   end 
  #Show errors if errors
  def valid_move(board, coord_x, coord_y)
    error1 = inputed_position(board, coord_x, coord_y)
    error2 = avaliable_cells(free_cells(board, coord_x, coord_y), coord_x, coord_y)

      if error1
        puts "\n"
        puts "Wrong Values, try again"
        puts "\n"
      elsif error2 != true 
        puts "\n"
        puts "position occuped, try again"
        puts "\n"
      else 
        valid_position = true
      end 
  end 
end 