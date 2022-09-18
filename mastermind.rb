# frozen_string_literal: true

require_relative "text_content"
require_relative "codesetter"
require_relative "codebreaker"
require_relative "user_input"

class Mastermind
  include TextContent
  include UserInput

  attr_accessor :target_code

  BOARD_SIZE = 12

  def initialize
    puts welcome
    @players = {}
    @target_code = []
  end

  def play
    initialize_players
    @players[:codesetter].play
  end

  private

  def initialize_players
    @players[:codesetter] = Codesetter.setter_class(select_codesetter).new(self, nil)
    @players[:codebreaker] = @players[:codesetter].opponent_class.new(self, @players[:codesetter])
  end

  def valid_code_elements
    %w[A B C D E F]
  end

end
