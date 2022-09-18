# frozen_string_literal: true

require_relative "player"

class Codesetter < Player
  def initialize(game, opponent)
    puts "Codesetter created"
    super(game, opponent)
  end

  def play
    @game.target_code = create_target_code
    @opponent.make_turn
  end

  def create_target_code
    []
  end
end

class HumanCodesetter < Codesetter
  def initialize(game, opponent)
    puts "Human"
    super(game, opponent)
  end

  def opponent_class
    ComputerCodebreaker
  end
end

class ComputerCodesetter < Codesetter
  def initialize(game, opponent)
    puts "Computer"
    super(game, opponent)
  end

  def opponent_class
    HumanCodebreaker
  end
end
