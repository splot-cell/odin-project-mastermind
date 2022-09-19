# frozen_string_literal: true

require_relative "player"
require_relative "user_input"
require_relative "text_content"

class Codebreaker < Player
end

class HumanCodebreaker < Codebreaker
  include UserInput

  def guess
    code_from_user
  end
end

class ComputerCodebreaker < Codebreaker
  def guess
    %w[A B C D]
  end
end
