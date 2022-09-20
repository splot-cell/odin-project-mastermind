# frozen_string_literal: true

module Formatting
  def formatting(description, string)
    {
      "underline" => "\e[4m#{string}\e[0m",
      "bold" => "\e[1m#{string}\e[0m",
      "bold-underline" => "\e[1;4m#{string}\e[0m",
      "italic-underline" => "\e[3;4m#{string}\e[0m",
      "red" => "\e[31m#{string}\e[0m"
    }[description]
  end

  def color_element(element)
    {
      "A" => "\e[41m A \e[0m",
      "B" => "\e[42m B \e[0m",
      "C" => "\e[43m C \e[0m",
      "D" => "\e[44m D \e[0m",
      "E" => "\e[45m E \e[0m",
      "F" => "\e[46m F \e[0m",
      " " => "   "
    }[element]
  end
end
