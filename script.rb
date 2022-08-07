class BoardRow
  def initalize
    @row = Array.new(4)
  end
end

class Board
  def initalize(size)
    @rows = Array.new(size, BoardRow.new)
    @current_row_index = 0
  end
end

class Game
  def initalize(codemaster_class, codebreaker_class)
    @board = Board.new(12)
  end
end
