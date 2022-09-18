# frozen_string_literal: true

module Formatting
  def formatting(description, string)
    {
      "underline" => "\e[4m#{string}\e[0m",
      "bold" => "\e[1m#{string}\e[0m",
      "italic" => "\e[3m#{string}\e[0m",
      "red" => "\e[31m#{string}\e[0m"
    }[description]
  end
end
