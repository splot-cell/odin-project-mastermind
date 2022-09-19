# frozen_string_literal: true

module Display
  def update_display
    clear_console
    print_board
  end

  def clear_console
    system("clear") || system("cls")
  end

  def print_board
    0.upto(max_guesses - 1) do |i|
      print_row(i)
    end
  end

  def empty_code
    Array.new(4, " ")
  end

  def empty_hint
    { positions: " ", values: " " }
  end

  def print_row(row_number)
    guess = guesses[row_number] || empty_code
    hint = hints[row_number] || empty_hint

    puts "#{format_code(guess)} || #{format_hint(hint)}"
  end

  def format_code(code)
    code.join("  ")
  end

  def format_hint(hint)
    "#{hint[:positions]}  #{hint[:values]}"
  end
end
