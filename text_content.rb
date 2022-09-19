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

    The target code was
    HEREDOC
  end

  def code_broken
    <<~HEREDOC

    The codebreaker guessed correctly! CODE BROKEN!

    HEREDOC
  end

  def play_again
    <<~HEREDOC

    Would you like to play again? (y/n)

    HEREDOC
  end

  def thank_you
    <<~HEREDOC

    Thank you for playing MASTERMIND.

    HEREDOC
  end

  def border(type)
    {
      top_left: "\u2554",
      top_right: "\u2557",
      bottom_left: "\u255a",
      bottom_right: "\u255b",
      left_t: "\u2560",
      right_t: "\u2563",
      top_t: "\u2566",
      bottom_t: "\u2569",
      hor: "\u2550",
      ver: "\u2551",
      cross: "\u256c"
    }[type]
  end
end
