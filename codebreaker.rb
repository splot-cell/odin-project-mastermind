# frozen_string_literal: true

class Codebreaker
  def initialize
    puts "Codebreaker created"
  end
end

class HumanCodebreaker < Codebreaker
  def initialize
    puts "Human"
    super
  end
end

class ComputerCodebreaker < Codebreaker
  def initialize
    puts "Computer"
    super
  end
end
