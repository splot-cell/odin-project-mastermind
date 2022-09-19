# frozen_string_literal: true

require_relative "player"
require_relative "user_input"
require_relative "text_content"

class HumanCodebreaker < Player
  include UserInput

  def guess
    code_from_user
  end
end

class ComputerCodebreaker < Player
  def guess
    %w[A B C D]
  end
end
