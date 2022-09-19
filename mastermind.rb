# frozen_string_literal: true

require_relative "text_content"
require_relative "codesetter"
require_relative "codebreaker"
require_relative "user_input"
require_relative "evaluate_guess_logic"
require_relative "display"

class Mastermind
  include TextContent
  include UserInput
  include EvaluteGuessLogic
  include Display

  attr_accessor :target_code, :guesses, :guess, :hints

  def initialize
    puts welcome
    @players = {}
    @target_code = []
    @guess = 0
    @guesses = []
    @hints = []
  end

  def play
    initialize_players
    codesetter.set_target_code
    guess_loop
    reset if play_again?
  end

  def guess_loop
    while guess < max_guesses
      guesses.push(codebreaker.guess)
      @guess += 1
      return codebreaker_wins if last_guess == target_code

      evaluate_last_guess
      update_display
    end
    codesetter_wins
  end

  def code_length
    4
  end

  def max_guesses
    12
  end

  def valid_code_elements
    %w[A B C D E F]
  end

  private

  def codesetter_wins
    puts out_of_guesses
  end

  def codebreaker_wins
    puts code_broken
    puts target_code
  end

  def last_guess
    guesses[guess - 1]
  end

  def last_hint
    hints[guess - 1]
  end

  def codesetter
    @players[:codesetter]
  end

  def codebreaker
    @players[:codebreaker]
  end

  def initialize_players
    if select_codesetter == "Human"
      codesetter_class = HumanCodesetter
      codebreaker_class = ComputerCodebreaker
    else
      codesetter_class = ComputerCodesetter
      codebreaker_class = HumanCodebreaker
    end
    @players[:codesetter] = codesetter_class.new(self)
    @players[:codebreaker] = codebreaker_class.new(self)
  end

  def reset
    @guess = 0
    @guesses = []
    @hints = []
    play
  end

  def play_again?
    true
  end
end
