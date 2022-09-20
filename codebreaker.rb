# frozen_string_literal: true

require_relative "player"
require_relative "user_input"
require_relative "text_content"

class HumanCodebreaker < Player
  include UserInput

  def guess
    code_from_user(@game.code_length, @game.valid_code_elements)
  end
end

class ComputerCodebreaker < Player
  include TextContent
  def initialize(game)
    super
    initialize_guesser
  end

  def guess
    thinking
    return initial_guess if @game.guess.zero?

    process_last_hint

    return attempt_identify_element unless @identified_elements.length == @game.code_length

    create_permutations unless @permutations
    next_permutation
  end

  private

  def thinking
    print making_guess
    3.times do
      print(".")
      sleep(0.5)
    end
  end

  def create_permutations
    @permutations = @identified_elements.permutation.to_a
    @permutations.uniq!
    @game.guesses.each do |guess|
      @permutations.delete(guess) if @permutations.include?(guess)
    end
  end

  def next_permutation
    @permutations.pop
  end

  def attempt_identify_element
    code = @identified_elements.clone
    next_element_to_test = @element_stack.pop

    code.length.upto(@game.code_length - 1) { code.push(next_element_to_test) }
    code
  end

  def process_last_hint
    (@game.last_hint[:positions] + @game.last_hint[:values] - @identified_elements.length).times do
      @identified_elements.push(@game.last_guess[@identified_elements.length])
    end
  end

  def initial_guess
    Array.new(@game.code_length, @element_stack.pop)
  end

  def initialize_guesser
    @element_stack = @game.valid_code_elements.shuffle
    @identified_elements = []
  end
end
