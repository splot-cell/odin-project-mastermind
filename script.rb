class Code
  def initalize(code)
    @code = code
  end

  protected
  attr_reader :code

  public
  def equal_to?(target)
    @code == target.code
  end
end

class Board
  def initalize(target_code)
    @rows = []
    @total_guesses = 0
    @target_code = Code.new(target_code)
  end

  def current_guess_correct?
    return if @total_guesses = 0
    @rows[@total_guesses - 1].equal_to?(@target_code)
  end

  def submit_guess

end

class Game
  ROLE = {
    master: 0,
    breaker: 1
  }
  MAX_GUESSES = 12
  def initialize(codemaster_class, codebreaker_class)
    @players = [codemaster_class.new(self, ROLE[:master]),
                codebreaker_class.new(self, ROLE[:breaker])]

    @board = Board.new(@players[ROLE[:master]].generate_code)
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
