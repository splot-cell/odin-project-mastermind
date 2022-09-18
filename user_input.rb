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
end
