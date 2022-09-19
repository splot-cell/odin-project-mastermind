# frozen_string_literal: true

require_relative "player"
require_relative "user_input"
require_relative "text_content"

class Codesetter < Player
  def set_target_code
    @game.target_code = %w[A B C C]
  end
end

class HumanCodesetter < Codesetter
  include UserInput
  def set_target_code
    @game.target_code = code_from_user
  end
end

class ComputerCodesetter < Codesetter
  def set_target_code
    code = []
    @game.code_length.times { code.push(@game.valid_code_elements.sample) }
    @game.target_code = code
  end
end
