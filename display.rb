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
    puts "Target code: #{format_code(target_code)}" if
      codesetter.class == HumanCodesetter
    puts top_row
    0.upto(max_guesses - 1) do |i|
      print_row(i)
    end
    puts bottom_row
  end

  def guess_area_size
    14
  end

  def hint_area_size
    6
  end

  def top_row
    "#{border(:top_left)}#{border(:hor) * guess_area_size}" \
      "#{border(:top_t)}#{border(:hor) * hint_area_size}" \
      "#{border(:top_right)}"
  end

  def bottom_row
    "#{border(:bottom_left)}#{border(:hor) * guess_area_size}" \
      "#{border(:bottom_t)}#{border(:hor) * hint_area_size}" \
      "#{border(:bottom_right)}"
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

    puts "#{border(:ver)} #{format_code(guess)} #{border(:ver)} #{format_hint(hint)} #{border(:ver)}"
  end

  def format_code(code)
    code.map { |e| color_element(e) }.join("")
  end

  def format_hint(hint)
    "#{hint[:positions]}  #{hint[:values]}"
  end
end
