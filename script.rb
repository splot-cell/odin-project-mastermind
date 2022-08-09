class Code
  def initialize(code)
    @code = code
  end

  protected
  attr_reader :code

  public
  def equal_to?(target)
    @code == target.code
  end

  def num_of_elements_correct_position(target)
    index = 0
    @code.reduce(0) { |sum, element|
      if element == target.code[index]
        sum += 1
      end
      index += 1
      sum
    }
  end

  def num_of_elements_wrong_position(target)
    index = 0
    target_copy = Array.new(target.code)
    @code.reduce(0) { |sum, element|
      if i = target_copy.index(element)
        target_copy[i] = nil
        sum += 1 unless i == index
      end
      index += 1
      sum
    }
  end
end

class Board
  def initialize(target_code)
    @rows = []
    @total_guesses = 0
    @target_code = Code.new(target_code)
  end

  def current_guess_correct?
    return if @total_guesses == 0
    @rows[@total_guesses - 1].equal_to?(@target_code)
  end

  def submit_guess(guess)
    @rows.push(Code.new(guess))
    @total_guesses += 1
  end

  def get_current_guess_feedback
    return if @total_guesses == 0
    [@rows[@total_guesses - 1].num_of_elements_correct_position(@target_code),
     @rows[@total_guesses - 1].num_of_elements_wrong_position(@target_code)]
  end
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
  attr_reader :board

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
game.board.submit_guess(["A", "B", "C", "D"])
puts game.board.get_current_guess_feedback

six = 6