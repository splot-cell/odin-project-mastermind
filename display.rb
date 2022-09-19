# frozen_string_literal: true

module Display
  def update_display
    clear_console
    puts "Here is an update"
  end

  def clear_console
    system("clear") || system("cls")
  end

  def print_board
    0.upto(max_guesses) do |i|
      print_row(i)
    end
  end

  def print_row(row_number)
    print_guess(row_number)
    print_hint(row_number)
  end

  def print_guess(guess_number)
  end

  def print_hint(hint_number)
  end
end
