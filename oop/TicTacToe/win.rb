module Win
  COMBINATIONS = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  def win(board)
    winner = [false]
    COMBINATIONS.each do |elem|
      first = elem[0]
      second = elem[1]
      third = elem[2]
      if board[first-1] == board[second-1] && board[second-1] == board[third-1]
        winner[0] = true
        winner[1] = board[first-1]
      end
    end
    winner
  end
end
