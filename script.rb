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
  def initialize(codemaster_class, codebreaker_class)
    @players = [codemaster_class.new(self, ROLE[:master]),
                codebreaker_class.new(self, ROLE[:breaker])]

    @board = Board.new(12, @players[ROLE[:master]].generate_code)
  end

  def playable_characters
    ["A", "B", "C", "D", "E", "F"]
  end
end

class Player
  def initialize(game, role)
    @game = game
    @role = role
  end
  attr_reader :role
end

class HumanPlayer < Player
end

class ComputerPlayer < Player
  def generate_code
    code = []
    4.times { code.push(@game.playable_characters.shuffle.first) }
    code
  end
end

game = Game.new(ComputerPlayer, HumanPlayer)
