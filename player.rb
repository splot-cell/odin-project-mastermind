# frozen_string_literal: true

class Player
  def initialize(game, opponent)
    @game = game
    @opponent = opponent
  end

  protected

  def opponent=(opponent)
    @opponent = opponent
  end
end
