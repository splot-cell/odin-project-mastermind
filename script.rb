class BoardRow
  def initalize
    @row = Array.new(4)
  end
end

class Board
  def initalize(size, target_code)
    @rows = Array.new(size, BoardRow.new)
    @current_row_index = 0
    @target_code = target_code
  end
end

class Game
  ROLE = {
    master: 0,
    breaker: 1
  }
  def initalize(codemaster_class, codebreaker_class)
    @players = [codemaster_class.new(self, ROLE[:master]),
                codebreaker_class.new(self, ROLE[:breaker])]

    @board = Board.new(12, @players[ROLE[:master]].generate_code)
  end
end

class Player
  def initialize(game, role)
    @game = game
    @role = role
  end
  attr_reader :role
end
