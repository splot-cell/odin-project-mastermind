# frozen_string_literal: true

require_relative "instructions_text"
require_relative "display"

class Mastermind
  include InstructionsText
  include Display

  BOARD_SIZE = 12

  def play
    print_instructions
  end

  private

  def valid_code_elements
    %w[A B C D E F]
  end

  def create_target_code
  end
end
