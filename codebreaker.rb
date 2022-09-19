# frozen_string_literal: true

require_relative "player"
require_relative "user_input"
require_relative "text_content"

class HumanCodebreaker < Player
  include UserInput

  def guess
    code_from_user(@game.code_length, @game.valid_code_elements)
  end
end

class ComputerCodebreaker < Player
  def initialize(game)
    super
    initialize_guesser
  end

  def guess
    %w[A B C D]
  end

  private

  def initialize_guesser
    @element_stack = @game.valid_code_elements.shuffle
    @identified_elements = []
  end

  def code_length
    @game.code_length
  end
end
