# frozen_string_literal: true

class Player
  attr_writer :opponent
  def initialize(game, opponent = nil)
    @game = game
    @opponent = opponent
  end

  def game_over?
    @game.guess == @game.max_guesses
  end
end
