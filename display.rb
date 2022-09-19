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
    0.upto(guess - 1) do |i|
      print_row(i)
    end
  end

  def print_row(row_number)
    puts "#{format_guess(row_number)} || #{format_hint(row_number)}"
  end

  def format_guess(guess_number)
    guesses[guess_number].join("  ")
  end

  def format_hint(hint_number)
    "#{hints[hint_number][:positions]}  #{hints[hint_number][:values]}"
  end
end
