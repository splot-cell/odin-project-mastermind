# frozen_string_literal: true

require_relative "text_content"
require_relative "codesetter"
require_relative "codebreaker"
require_relative "user_input"

class Mastermind
  include TextContent
  include UserInput

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
    @players[:codesetter].play
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

  def initialize_players
    @players[:codesetter] = Codesetter.setter_class(select_codesetter).new(self)
    @players[:codebreaker] = @players[:codesetter].opponent_class.new(self, @players[:codesetter])
  end
end
