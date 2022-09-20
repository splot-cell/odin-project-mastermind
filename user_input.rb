# frozen_string_literal: true

require_relative "text_content"

# module containing user input fetching and sanitation
module UserInput
  include TextContent

  def select_codesetter
    puts player_selection
    selection = gets.chomp
    return codesetter_from(selection) if selection.match(/^[1-2]$/)

    puts error_message("selection_error")
    select_codesetter
  end

  def codesetter_from(selection_string)
    selection_string == "1" ? "Human" : "Computer"
  end

  def code_from_user(code_length, valid_code_elements)
    loop do
      puts code_prompt
      code = gets.chomp.upcase.split(/\s*/, code_length)
      return code if code.any? &&
                     code.all? { |e| valid_code_elements.include?(e) }

      puts error_message("code_error")
    end
  end

  def play_again?
    puts play_again
    selection = gets.chomp
    return bool_from(selection) if selection.match(/[yn]/)

    puts error_message("selection_error")
    play_again?
  end

  def bool_from(char)
    char == "y"
  end
end
