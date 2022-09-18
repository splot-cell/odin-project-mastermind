class Player
  attr_accessor :opponent
  def initialize(game, opponent)
    @game = game
    @opponent = opponent
  end
end
