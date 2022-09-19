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
      "selection_error" => formatting("red", "Invalid selection. Try again."),
      "code_error" => formatting("red", "Invalid code. Try again.")
    }[error]
  end

  def code_prompt
    <<~HEREDOC

    Enter a code:
    HEREDOC
  end

  def out_of_guesses
    <<~HEREDOC

    OH NO! You ran out of guesses!

    The target code was #{target_code}
    HEREDOC
  end

  def code_broken
    <<~HEREDOC

    The codebreaker guessed correctly! CODE BROKEN!

    HEREDOC
  end
end
