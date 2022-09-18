# frozen_string_literal: true

require_relative "console_formatting"

module TextContent
  include Formatting

  def welcome
    <<~HEREDOC


    #{formatting('underline', 'WELCOME TO MASTERMIND')}

    Type '?' and hit ENTER to view instructions


    HEREDOC
  end

  def instructions
    <<~HEREDOC

    #{formatting('italic', 'Instructions go here')}

    Type '1' and press ENTER to be the code SETTER
    Type '2' and press ENTER to be the code BREAKER

    HEREDOC
  end
end
