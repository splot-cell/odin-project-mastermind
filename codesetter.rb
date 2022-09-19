# frozen_string_literal: true

require_relative "player"
require_relative "codebreaker"

class Codesetter < Player
  def self.setter_class(identifier)
    {
      "Human" => HumanCodesetter,
      "Computer" => ComputerCodesetter
    }[identifier]
  end

  def play
    @game.target_code = create_target_code
    @opponent.make_turn
  end

  def create_target_code
    %w[A B C C]
  end
end

class HumanCodesetter < Codesetter
  def opponent_class
    ComputerCodebreaker
  end
end

class ComputerCodesetter < Codesetter
  def opponent_class
    HumanCodebreaker
  end

  def make_turn
  end
end
