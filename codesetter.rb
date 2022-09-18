# frozen_string_literal: true

class Codesetter
  def initialize
    puts "Codesetter created"
  end
end

class HumanCodesetter < Codesetter
  def initialize
    puts "Human"
    super
  end

  def opponent_class
    ComputerCodebreaker
  end
end

class ComputerCodesetter < Codesetter
  def initialize
    puts "Computer"
    super
  end

  def opponent_class
    HumanCodebreaker
  end
end
