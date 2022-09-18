# frozen_string_literal: true

require_relative "text_content"
require_relative "display"

class Mastermind
  include TextContent
  include Display

  BOARD_SIZE = 12

  def play
    puts instructions
  end

  private

  def valid_code_elements
    %w[A B C D E F]
  end
end
