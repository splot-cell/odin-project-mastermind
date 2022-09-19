# frozen_string_literal: true

module Display
  def update_display
    clear_console
    puts "Here is an update"
  end

  def clear_console
    system("clear") || system("cls")
  end
end
