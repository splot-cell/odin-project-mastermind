# frozen_string_literal: true

require_relative "text_content"
require_relative "codesetter"
require_relative "codebreaker"
require_relative "display"

class Mastermind
  include TextContent
  include Display

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

  def select_role
    puts player_selection
    selection = gets.chomp
    return selection if selection.match(/^[1-2]$/)

    puts error_message("input_error")
    select_role
  end

  def codesetter_class_from(number_string)
    number_string == "1" ? HumanCodesetter : ComputerCodesetter
  end

  def initialize_players
    @players[:codesetter] = codesetter_class_from(select_role).new(self, nil)
    @players[:codebreaker] = @players[:codesetter].opponent_class.new(self, @players[:codesetter])
  end

  def valid_code_elements
    %w[A B C D E F]
  end

end
