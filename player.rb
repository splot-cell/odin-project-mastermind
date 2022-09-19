# frozen_string_literal: true

class Player
  attr_writer :opponent

  def initialize(game)
    @game = game
  end
end
