require_relative "text_content"

module UserInput
  def select_codesetter
    puts player_selection
    selection = gets.chomp
    return codesetter_from(selection) if selection.match(/^[1-2]$/)

    puts error_message("input_error")
    select_codesetter
  end

  def codesetter_from(selection_string)
    selection_string == "1" ? "Human" : "Computer"
  end

  def user_selection
    loop do
      print "Enter a code: "
      selection = gets.chomp.upcase.split(/\s*/, @game.code_length)
      return selection if selection.all? { |e| @game.valid_code_elements.include?(e) }

      puts "Invalid code. Try again."
    end
  end
end
