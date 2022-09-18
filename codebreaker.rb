# frozen_string_literal: true

require_relative "player"

class Codebreaker < Player
  def initialize(game, opponent)
    puts "Codebreaker created"
    opponent.opponent = self
    super(game, opponent)
  end

  def make_turn
  end
end

class HumanCodebreaker < Codebreaker
  def initialize(game, opponent)
    puts "Human"
    super(game, opponent)
  end
end

class ComputerCodebreaker < Codebreaker
  def initialize(game, opponent)
    puts "Computer"
    super(game, opponent)
  end
end
