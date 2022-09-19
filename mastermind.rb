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
  attr_reader :codesetter, :codebreaker

  def initialize
    puts welcome
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
      update_display
      guesses.push(codebreaker.guess)
      @guess += 1
      return codebreaker_wins if last_guess == target_code

      hints.push(evaluate_guess(last_guess, target_code))
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
    puts format_code(target_code)
  end

  def codebreaker_wins
    puts code_broken
  end

  def last_guess
    guesses[guess - 1]
  end

  def last_hint
    hints[guess - 1]
  end

  def initialize_players
    if select_codesetter == "Human"
      @codesetter = HumanCodesetter.new(self)
      @codebreaker = ComputerCodebreaker.new(self)
    else
      @codesetter = ComputerCodesetter.new(self)
      @codebreaker = HumanCodebreaker.new(self)
    end
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
