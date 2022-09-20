# frozen_string_literal: true

require_relative "console_formatting"

# module containing all text for communicating with user
module TextContent
  include Formatting

  def welcome
    <<~HEREDOC


    #{formatting('bold-underline', 'WELCOME TO MASTERMIND')}

    HEREDOC
      .concat(instructions)
  end

  def instructions
    <<~HEREDOC

    #{formatting('italic-underline', 'How to play')}

    You can play as either the code#{formatting('bold', 'SETTER')} or code#{formatting('bold', 'BREAKER')}.

    The codeSETTER sets a target code, which the codeBREAKER must guess in 12 or fewer turns.

    Codes are made up of four code #{formatting('bold', 'ELEMENTS')}. Acceptable elements are:
      #{color_element("A")} #{color_element("B")} #{color_element("C")} #{color_element("D")} #{color_element("E")} #{color_element("F")}

    So, an example code may look like:
      #{format_code(%w[E B C C])}

    When prompted, you can enter codes by typing four letters and pressing enter.

    For each guess, the game will provide you a hint in the form of two numbers:
      1) The first number will display how many code elements are the corect value #{formatting('bold', 'and')} are in the correct position.
      2) The second number will display how many code elements have the correct value, but are in the #{formatting('bold', 'incorrect')} position.

    Good luck!

    HEREDOC
  end

  def player_selection
    <<~HEREDOC

    Type '1' and press enter to be the code SETTER
    Type '2' and press enter to be the code BREAKER

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

    The codebreaker ran out of guesses!

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
      bottom_right: "\u255d",
      left_t: "\u2560",
      right_t: "\u2563",
      top_t: "\u2566",
      bottom_t: "\u2569",
      hor: "\u2550",
      ver: "\u2551",
      cross: "\u256c"
    }[type]
  end

  def setting_code
    "\nSetting a secure code"
  end

  def making_guess
    "\n\nThinking of a code"
  end
end
