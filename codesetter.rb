# frozen_string_literal: true

require_relative "player"
require_relative "codebreaker"
require_relative "text_content"

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

  private

  def compare_last_guess
    code = @game.guesses[@game.guess - 1]
    correct_positions = get_correct_positions(code, @game.target_code)
    filter = correct_positions.map(&:!)
    correct_values = get_correct_values(
      apply_search_filter(code, filter),
      apply_search_filter(@game.target_code, filter)
    )
    @game.hints.push([correct_positions.sum { |e| e ? 1 : 0 },
                      correct_values.sum { |e| e ? 1 : 0 }])
  end

  def get_correct_positions(code1, code2)
    code1.map.with_index { |element, i| element == code2[i] }
  end

  def apply_search_filter(code, filter)
    code.map.with_index { |element, i| filter[i] ? element : nil }
  end

  def get_correct_values(query, target)
    values = Array.new(query.length, false)
    filter = Array.new(query.length, true)
    query.each_index do |i|
      next unless query[i]

      next unless (found_index = target.index(query[i]))

      filter[found_index] = false
      target = apply_search_filter(target, filter)
      values[i] = true
    end
    values
  end
end

class HumanCodesetter < Codesetter
  def opponent_class
    ComputerCodebreaker
  end
end

class ComputerCodesetter < Codesetter
  include TextContent

  def opponent_class
    HumanCodebreaker
  end

  def setter_wins
    puts out_of_guesses
    puts @game.target_code
  end

  def breaker_wins
    puts code_broken
  end

  def make_turn
    return setter_wins if game_over?
    return breaker_wins if correct_guess?

    compare_last_guess
    @opponent.make_turn
  end
end
