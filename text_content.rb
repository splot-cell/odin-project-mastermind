# frozen_string_literal: true

require_relative "console_formatting"

module TextContent
  include Formatting

  def welcome
    <<~HEREDOC


    #{formatting('underline', 'WELCOME TO MASTERMIND')}

    HEREDOC
      .concat(instructions)
  end

  def instructions
    <<~HEREDOC

    #{formatting('italic', 'Instructions go here')}

    HEREDOC
  end

  def player_selection
    <<~HEREDOC

    Type '1' and press ENTER to be the code SETTER
    Type '2' and press ENTER to be the code BREAKER

    HEREDOC
  end

  def error_message(error)
    {
      "input_error" => formatting("red", "Invalid selection. Try again.")
    }[error]
  end
end
