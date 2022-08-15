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

  def get_key_values(target)
    result = {}
    result[:correct_positions] = get_correct_positions(@code, target.code)
    filter = result[:correct_positions].map(&:!)
    result[:correct_values] = get_correct_values(
      apply_search_filter(@code, filter),
      apply_search_filter(target.code, filter)
    )
    [result[:correct_positions].sum { |e| e ? 1 : 0 },
     result[:correct_values].sum { |e| e ? 1 : 0 }]
  end

  private

  def get_correct_positions(code1, code2)
    code1.map.with_index { |element, i| element == code2[i] }
  end

  def apply_search_filter(code, filter)
    code.map.with_index { |element, i| filter[i] ? element : nil }
  end

  def get_correct_values(query, target)
    values = Array.new(query.length, false)
    filter = Array.new(query.length, true)
    query.each_index do |i|
      next unless query[i]

      next unless (found_index = target.index(query[i]))

      filter[found_index] = false
      target = apply_search_filter(target, filter)
      values[i] = true
    end
    values
  end
end

class Board
  def initialize(target_code)
    @rows = []
    @total_guesses = 0
    @target_code = Code.new(target_code)
  end

  def current_guess_correct?
    return if @total_guesses.zero?

    @rows[@total_guesses - 1].equal_to?(@target_code)
  end

  def submit_guess(guess)
    @rows.push(Code.new(guess))
    @total_guesses += 1
  end

  def current_guess_keys
    return if @total_guesses.zero?

    @rows[@total_guesses - 1].get_key_values(@target_code)
  end
end

class Game
  ROLE = {
    master: 0,
    breaker: 1
  }.freeze
  MAX_GUESSES = 12
  CODE_LENGTH = 4
  def initialize(codemaster_class, codebreaker_class)
    @players = [codemaster_class.new(self, ROLE[:master]),
                codebreaker_class.new(self, ROLE[:breaker])]

    @board = Board.new(@players[ROLE[:master]].generate_code)
  end
  attr_reader :board

  def playable_characters
    %w[A B C D E F]
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
  def generate_code

  end

  def make_guess

  end

  private

  def get_user_selection
    loop do
      print "Enter a code: "
      selection = gets.upcase.split(/\s*/, @game.CODE_LENGTH)
      return selection if selection.all? { |e| @game.playable_characters.include?(e) }

      puts "Invalid code. Try again."
    end
  end
end

class ComputerPlayer < Player
  def generate_code
    code = []
    @game.CODE_LENGTH.times { code.push(@game.playable_characters.sample) }
    code
  end
end

class TestPlayer < Player
  def generate_code
    %w[A B C C]
  end
end

game = Game.new(TestPlayer, HumanPlayer)
game.board.submit_guess(%w[C C C D])
puts game.board.current_guess_keys
